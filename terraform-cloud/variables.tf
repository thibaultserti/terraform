
variable "token" {
  type        = string
  description = "Token to authenticate on Terraform Cloud backend"

}

variable "organization_name" {
  type        = string
  description = "Organization name"
  default     = "thibaultserti"

}

variable "github_app_installation_id" {
  type        = string
  description = "Can be found here https://app.terraform.io/app/settings/tokens"
}

variable "agent_pool_name" {
  type        = string
  description = "Agent pool name"
  default     = "infra"

}

variable "webhook" {
  type        = string
  description = "Slack compatible webhhok url"
}

variable "ssh_key_id" {
  type        = string
  description = "SSH key name to use to clone modules"
}

variable "workspaces" {
  type = list(object({
    name              = string
    description       = string
    execution_mode    = optional(string, "agent")
    notification_type = optional(string, "slack")
    working_directory = optional(string)
    vcs_repo          = optional(string, "thibaultserti/terraform")
    auto_apply        = optional(bool, true)
    webhhok           = optional(string)
  }))

}

variable "terraform_version" {
  type        = string
  description = "Terraform version"
  default     = "1.5.6"

}