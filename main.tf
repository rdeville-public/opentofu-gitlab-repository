# Manage gitlab repository
resource "gitlab_project" "this" {
  name        = var.settings_name
  description = var.settings_description

  path         = var.settings_path
  namespace_id = var.settings_namespace_id

  default_branch                                   = var.settings_default_branch
  allow_merge_on_skipped_pipeline                  = var.settings_allow_merge_on_skipped_pipeline
  analytics_access_level                           = var.settings_analytics_access_level
  approvals_before_merge                           = var.settings_approvals_before_merge
  archive_on_destroy                               = var.settings_archive_on_destroy
  archived                                         = var.settings_archived
  auto_cancel_pending_pipelines                    = var.settings_auto_cancel_pending_pipelines
  auto_devops_deploy_strategy                      = var.settings_auto_devops_deploy_strategy
  auto_devops_enabled                              = var.settings_auto_devops_enabled
  autoclose_referenced_issues                      = var.settings_autoclose_referenced_issues
  avatar                                           = var.settings_avatar
  avatar_hash                                      = var.settings_avatar != null ? filesha256(var.settings_avatar) : null
  build_git_strategy                               = var.settings_build_git_strategy
  build_timeout                                    = var.settings_build_timeout
  builds_access_level                              = var.settings_builds_access_level
  ci_config_path                                   = var.settings_ci_config_path
  ci_default_git_depth                             = var.settings_ci_default_git_depth
  ci_forward_deployment_enabled                    = var.settings_ci_forward_deployment_enabled
  ci_restrict_pipeline_cancellation_role           = var.settings_ci_restrict_pipeline_cancellation_role
  ci_separated_caches                              = var.settings_ci_separated_caches
  container_registry_access_level                  = var.settings_container_registry_access_level
  emails_enabled                                   = var.settings_emails_enabled
  environments_access_level                        = var.settings_environments_access_level
  external_authorization_classification_label      = var.settings_external_authorization_classification_label
  feature_flags_access_level                       = var.settings_feature_flags_access_level
  forked_from_project_id                           = var.settings_forked_from_project_id
  forking_access_level                             = var.settings_forking_access_level
  group_runners_enabled                            = var.settings_group_runners_enabled
  use_custom_template                              = var.settings_use_custom_template
  group_with_project_templates_id                  = var.settings_group_with_project_templates_id
  import_url                                       = var.settings_import_url
  import_url_password                              = var.settings_import_url_password
  import_url_username                              = var.settings_import_url_username
  mirror                                           = var.settings_mirror
  infrastructure_access_level                      = var.settings_infrastructure_access_level
  initialize_with_readme                           = var.settings_initialize_with_readme
  issues_access_level                              = var.settings_issues_access_level
  issues_template                                  = var.settings_issues_template
  keep_latest_artifact                             = var.settings_keep_latest_artifact
  lfs_enabled                                      = var.settings_lfs_enabled
  merge_commit_template                            = var.settings_merge_commit_template
  merge_method                                     = var.settings_merge_method
  merge_pipelines_enabled                          = var.settings_merge_pipelines_enabled
  merge_requests_access_level                      = var.settings_merge_requests_access_level
  merge_requests_template                          = var.settings_merge_requests_template
  merge_trains_enabled                             = var.settings_merge_trains_enabled
  mirror_overwrites_diverged_branches              = var.settings_mirror_overwrites_diverged_branches
  mirror_trigger_builds                            = var.settings_mirror_trigger_builds
  monitor_access_level                             = var.settings_monitor_access_level
  mr_default_target_self                           = var.settings_mr_default_target_self
  only_allow_merge_if_all_discussions_are_resolved = var.settings_only_allow_merge_if_all_discussions_are_resolved
  only_allow_merge_if_pipeline_succeeds            = var.settings_only_allow_merge_if_pipeline_succeeds
  only_mirror_protected_branches                   = var.settings_only_mirror_protected_branches
  packages_enabled                                 = var.settings_packages_enabled
  pages_access_level                               = var.settings_pages_access_level
  printing_merge_request_link_enabled              = var.settings_printing_merge_request_link_enabled
  public_jobs                                      = var.settings_public_jobs
  releases_access_level                            = var.settings_releases_access_level
  remove_source_branch_after_merge                 = var.settings_remove_source_branch_after_merge
  repository_access_level                          = var.settings_repository_access_level
  repository_storage                               = var.settings_repository_storage
  request_access_enabled                           = var.settings_request_access_enabled
  requirements_access_level                        = var.settings_requirements_access_level
  resolve_outdated_diff_discussions                = var.settings_resolve_outdated_diff_discussions
  restrict_user_defined_variables                  = var.settings_restrict_user_defined_variables
  security_and_compliance_access_level             = var.settings_security_and_compliance_access_level
  shared_runners_enabled                           = var.settings_shared_runners_enabled
  skip_wait_for_default_branch_protection          = var.settings_skip_wait_for_default_branch_protection
  snippets_access_level                            = var.settings_snippets_access_level
  squash_commit_template                           = var.settings_squash_commit_template
  squash_option                                    = var.settings_squash_option
  suggestion_commit_message                        = var.settings_suggestion_commit_message
  template_name                                    = var.settings_template_name
  template_project_id                              = var.settings_template_project_id
  topics                                           = var.settings_topics
  visibility_level                                 = var.settings_visibility_level
  wiki_access_level                                = var.settings_wiki_access_level

  dynamic "container_expiration_policy" {
    for_each = var.settings_container_expiration_policy

    content {
      cadence           = container_expiration_policy.value.cadence
      enabled           = container_expiration_policy.value.enabled
      keep_n            = container_expiration_policy.value.keep_n
      name_regex_delete = container_expiration_policy.value.name_regex_delete
      name_regex_keep   = container_expiration_policy.value.name_regex_keep
      older_than        = container_expiration_policy.value.older_than
    }
  }

  dynamic "timeouts" {
    for_each = var.settings_timeouts

    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
    }
  }
}

# Manage gitlab repository branch protection rules
resource "gitlab_branch_protection" "this" {
  for_each = var.branches_protection

  project = gitlab_project.this.id
  branch  = each.key

  allow_force_push             = each.value.allow_force_push
  code_owner_approval_required = each.value.code_owner_approval_required
  push_access_level            = each.value.push_access_level
  merge_access_level           = each.value.merge_access_level
  unprotect_access_level       = each.value.unprotect_access_level

  dynamic "allowed_to_merge" {
    for_each = each.value.allowed_to_merge.group_id

    content {
      group_id = allowed_to_merge.value
    }
  }

  dynamic "allowed_to_merge" {
    for_each = each.value.allowed_to_merge.user_id

    content {
      user_id = allowed_to_merge.value
    }
  }

  dynamic "allowed_to_push" {
    for_each = each.value.allowed_to_push.group_id

    content {
      group_id = allowed_to_push.value
    }
  }

  dynamic "allowed_to_push" {
    for_each = each.value.allowed_to_push.user_id

    content {
      user_id = allowed_to_push.value
    }
  }

  dynamic "allowed_to_unprotect" {
    for_each = each.value.allowed_to_unprotect.group_id

    content {
      group_id = allowed_to_unprotect.value
    }
  }

  dynamic "allowed_to_unprotect" {
    for_each = each.value.allowed_to_unprotect.user_id

    content {
      user_id = allowed_to_unprotect.value
    }
  }

}

# Manage gitlab repository branch protection rules
resource "gitlab_tag_protection" "this" {
  for_each = var.tags_protection

  project = gitlab_project.this.id
  tag     = each.key

  create_access_level = each.value.create_access_level

  dynamic "allowed_to_create" {
    for_each = each.value.allowed_to_create.user_id

    content {
      access_level = allowed_to_create.value.access_level
      user_id      = allowed_to_create.value.user_id
    }
  }

  dynamic "allowed_to_create" {
    for_each = each.value.allowed_to_create.group_id

    content {
      access_level = allowed_to_create.value.access_level
      group_id     = allowed_to_create.value.group_id
    }
  }
}
