output "repository_id" {
  value       = gitlab_project.this.id
  description = "ID of the deployed repository"
}

output "repository_clone_ssh" {
  value       = gitlab_project.this.ssh_url_to_repo
  description = "SSH Url to clone the deployed repository"
}

output "repository_clone_https" {
  value       = gitlab_project.this.http_url_to_repo
  description = "SSH Url to clone the deployed repository"
}

output "repository_web_url" {
  value       = gitlab_project.this.web_url
  description = "Web Url to the deployed repository"
}
