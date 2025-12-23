locals {
  # Common tags for all module's resources
  common_tags = {
    ProjectName = var.project_name
    RepoName    = var.repo_name
    Environment = var.infra_env
    RegionName  = var.region_name
    ManagedBy   = "terraform"
  }
}