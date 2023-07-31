resource "tfe_workspace" "workspaces" {
  for_each = { for obj in var.workspaces : obj.name => obj }

  name              = each.value.name
  description       = each.value.description
  organization      = data.tfe_organization.org.name
  agent_pool_id     = each.value.execution_mode == "agent" ? tfe_agent_pool.agent_pool.id : null
  execution_mode    = each.value.execution_mode
  working_directory = each.value.working_directory != null ? each.value.working_directory : each.value.name
  trigger_patterns  = each.value.working_directory != null ? [format("%s/**/*", each.value.working_directory)] : [format("%s/**/*", each.value.name)]
  auto_apply        = each.value.auto_apply
  ssh_key_id        = var.ssh_key_id
  vcs_repo {
    identifier                 = each.value.vcs_repo
    github_app_installation_id = var.github_app_installation_id
  }
}

resource "tfe_notification_configuration" "notifications" {
  for_each = { for obj in var.workspaces : obj.name => obj }

  name             = each.value.name
  enabled          = each.value.webhhok != null || var.webhook != null
  destination_type = each.value.notification_type
  triggers         = ["run:needs_attention", "run:completed", "run:errored"]
  url              = each.value.webhhok != null ? each.value.webhook : var.webhook
  workspace_id     = tfe_workspace.workspaces[each.value.name].id
}
