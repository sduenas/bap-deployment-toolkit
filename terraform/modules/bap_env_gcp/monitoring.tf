data "google_project" "project" {
}

module "agent_policy" {
  source     = "terraform-google-modules/cloud-operations/google//modules/agent-policy"
  version    = "~> 0.3.0"

  project_id = data.google_project.project.project_id
  policy_id  = "ops-agents-policy"
  agent_rules = [
    {
      type               = "ops-agent"
      version            = "current-major"
      package_state      = "installed"
      enable_autoupgrade = true
    }
  ]
  os_types = [
    {
      short_name = "${var.os_image_family}"
      version    = "${var.os_image_version}"
    }
  ]
}
