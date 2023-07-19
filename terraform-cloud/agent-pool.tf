resource "tfe_agent_pool" "agent_pool" {
  name                = var.agent_pool_name
  organization        = data.tfe_organization.org.name
  organization_scoped = true
}
