locals {
  # Common tags for all module's resources
  common_tags = {
    ProjectName = var.project_name
    RepoName    = var.repo_name
    RegionName  = var.region_name
    Environment = var.infra_env
    ManagedBy   = "terraform"
  }
}