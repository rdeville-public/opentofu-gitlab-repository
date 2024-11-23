output "id" {
  value       = gitlab_project.this.id
  description = "The repository ID"
}

output "name" {
  value       = gitlab_project.this.name
  description = "The repository name."
}

output "path" {
  value       = gitlab_project.this.path
  description = "The repository path."
}

output "path_with_namespace" {
  value       = gitlab_project.this.path_with_namespace
  description = "The repository path_with_namespace."
}

output "ssh_url_to_repo" {
  value       = gitlab_project.this.ssh_url_to_repo
  description = "SSH Url to clone the deployed repository"
}

output "http_url_to_repo" {
  value       = gitlab_project.this.http_url_to_repo
  description = "SSH Url to clone the deployed repository"
}

output "web_url" {
  value       = gitlab_project.this.web_url
  description = "Web Url to the deployed repository"
}

output "access_tokens" {
  value       = gitlab_project_access_token.this
  description = "Access tokens associated to the repo"
}
