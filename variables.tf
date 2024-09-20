# Repository settings variables
# ------------------------------------------------------------------------
variable "settings_name" {
  type        = string
  description = "The name of the project."
}

variable "settings_description" {
  type        = string
  description = "A description of the project."

  nullable = false
}

variable "settings_path" {
  type        = string
  description = <<-EOM
  The path of the repository, will be set to `settings_name` if not provided.
  EOM

  default = null
}

variable "settings_namespace_id" {
  type        = number
  description = <<-EOM
  The namespace group or user of the project. Defaults to the user using this

  EOM

  default = null
}

variable "settings_default_branch" {
  type        = string
  description = "The default branch for the project."

  nullable = false
  default  = "main"
}

variable "settings_allow_merge_on_skipped_pipeline" {
  type        = bool
  description = <<-EOM
  Set to `false` if you do not want to treat skipped pipelines as if they
  finished with success.
  EOM

  nullable = false
  default  = true
}

variable "settings_analytics_access_level" {
  type        = string
  description = <<-EOM
  Set the analytics access level. Valid values are `disabled`, `private`, `enabled`.
  EOM

  nullable = false
  default  = "disabled"
}

variable "settings_approvals_before_merge" {
  type        = number
  description = <<-EOM
  Number of merge request approvals required for merging. Default is 1.

  Note: [From terraform resource](https://registry.terraform.io/providers/gitlabhq/gitlab/latest/docs/resources/project#approvals_before_merge):

  > This field does not work well in combination with the resource
  > `gitlab_project_approval_rule` resource and is most likely gonna be deprecated
  > in a future GitLab version (see [this upstream epic](https://gitlab.com/groups/gitlab-org/-/epics/7572)).
  >
  > In the meantime we recommend against using this attribute and use
  > `gitlab_project_approval_rule` instead.

  So for the moment, use this variable until deprecated in favor of variable
  `approval_rule`.
  EOM

  nullable = false
  default  = 1
}

variable "settings_archive_on_destroy" {
  type        = bool
  description = <<-EOM
  Set to `true` to archive the project instead of deleting on destroy.

  If set to `true` it will entire omit the DELETE operation.
  EOM

  nullable = false
  default  = false
}

variable "settings_archived" {
  type        = bool
  description = <<-EOM
  Whether the project is in read-only mode (archived).

  Repositories can be archived/unarchived by toggling this parameter.
  EOM

  nullable = false
  default  = false
}

variable "settings_auto_cancel_pending_pipelines" {
  type        = string
  description = <<-EOM
  Auto-cancel pending pipelines. This isn’t a boolean, but `enabled/disabled`.
  EOM

  nullable = false
  default  = "enabled"
}

variable "settings_auto_devops_deploy_strategy" {
  type        = string
  description = <<-EOM
  Auto Deploy strategy. Valid values are `continuous`, `manual`,
  `timed_incremental`.
  EOM

  nullable = false
  default  = "manual"
}

variable "settings_auto_devops_enabled" {
  type        = bool
  description = "Enable Auto DevOps for this project."

  nullable = false
  default  = false
}

variable "settings_autoclose_referenced_issues" {
  type        = bool
  description = "Set whether auto-closing referenced issues on default branch."

  nullable = false
  default  = true
}

variable "settings_avatar" {
  type        = string
  description = <<-EOM
  A local path to the avatar image to upload.

  Note: not available for imported resources.
  EOM

  default = null
}

variable "settings_build_git_strategy" {
  type        = string
  description = <<-EOM
  The Git strategy. Defaults to fetch. Valid values are `clone`, `fetch`.
  EOM

  nullable = false
  default  = "fetch"
}

variable "settings_build_timeout" {
  type        = number
  description = "The maximum amount of time, in seconds, that a job can run."

  nullable = false
  default  = 3600
}

variable "settings_builds_access_level" {
  type        = string
  description = <<-EOM
  Set the builds access level. Valid values are `disabled`, `private`, `enabled`.
  EOM

  nullable = false
  default  = "disabled"
}

variable "settings_ci_config_path" {
  type        = string
  description = "Custom Path to CI config file."

  nullable = false
  default  = ".gitlab-ci.yml"
}

variable "settings_ci_default_git_depth" {
  type        = number
  description = "Default number of revisions for shallow cloning."

  nullable = false
  default  = 20
}

variable "settings_ci_forward_deployment_enabled" {
  type        = bool
  description = <<-EOM
  When a new deployment job starts, skip older deployment jobs that are still
  pending.
  EOM

  nullable = false
  default  = true
}

variable "settings_ci_restrict_pipeline_cancellation_role" {
  type        = string
  description = <<-EOM
  The role required to cancel a pipeline or job. Valid values are `developer`,
  `maintainer`, `no one`.

  Note: Introduced in GitLab 16.8. Premium and Ultimate only.
  EOM

  nullable = false
  default  = "no one"
}

variable "settings_ci_separated_caches" {
  type        = bool
  description = "Use separate caches for protected branches."

  nullable = false
  default  = true
}

variable "settings_container_expiration_policy" {
  # Key is only a human readable identifier
  type = map(object({
    enabled      = optional(bool, true)
    cadence      = optional(string, "1d")
    keep_n       = optional(string)
    regex_delete = optional(string)
    regex_keep   = optional(string)
    older_than   = optional(string)
  }))

  description = <<-EOM
  Map of object, where key is just a human readable identifier, to set the image
  cleanup policy for this project. Objects support following attributes:

  * `enabled`: Boolean, optional, if true, the policy is enabled. Default to
    `true`.
  * `cadence`: String, optional, the cadence of the policy. Valid values are:
    `1d`, `7d`, `14d`, `1month`, `3month`. Default to `1d`.
  * `keep_n`: Number, optional, the number of image to keep. Valid values are:
    `1`, `5`, `10`, `25`, `50`, `100`. Default to `null`.
  * `regex_delete`: String, optional, the regular expression to match image
    names to delete. Default to `null`.
  * `regex_keep`: String, optional, the regular expression to match image
    names to keep. Default to `null`.
  * `older_than`: String, optional, the number of days to keep images. Valid
    values are: `7d`, `14d`, `30d`, `90d`. Default to `null`.

  Note: this field is sometimes named `container_expiration_policy_attributes`
  in the GitLab Upstream API.
  EOM

  nullable = false
  default  = {}
}

variable "settings_container_registry_access_level" {
  type        = string
  description = <<-EOM
  Set visibility of container registry, for this project. Valid values are
  `disabled`, `private`, `enabled`.
  EOM

  nullable = false
  default  = "disabled"
}

variable "settings_emails_enabled" {
  type        = bool
  description = "Enable email notifications."

  nullable = false
  default  = false
}

variable "settings_environments_access_level" {
  type        = string
  description = <<-EOM
  Set the environments access level. Valid values are `disabled`, `private`,
  `enabled`.
  EOM

  nullable = false
  default  = "disabled"
}

variable "settings_external_authorization_classification_label" {
  type        = string
  description = "The classification label for the project."

  nullable = false
  default  = "TODO::To Classify"
}

variable "settings_feature_flags_access_level" {
  type        = string
  description = <<-EOM
  Set the feature flags access level. Valid values are `disabled`, `private`,
  `enabled`.
  EOM

  nullable = false
  default  = "disabled"
}

variable "settings_forked_from_project_id" {
  type        = number
  description = <<-EOM
  The id of the project to fork. During create the project is forked and during
  an update the fork relation is changed.
  EOM

  default = null
}

variable "settings_forking_access_level" {
  type        = string
  description = <<-EOM
  Set the forking access level. Valid values are `disabled`, `private`, `enabled`.
  EOM

  nullable = false
  default  = "disabled"
}

variable "settings_group_runners_enabled" {
  type        = bool
  description = "Enable group runners for this project."

  nullable = false
  default  = false
}

variable "settings_use_custom_template" {
  type        = bool
  description = <<-EOM
  Use either custom instance or group (with
  `settings_group_with_project_templates_id`, project template (enterprise
  edition).

  ~> When using a custom template, Group Tokens won't work. You must use a real
  user's Personal Access Token.
  EOM

  default = null
}


variable "settings_group_with_project_templates_id" {
  type        = number
  description = <<-EOM
  For group-level custom templates, specifies ID of group from which all the
  custom project templates are sourced.

  Leave empty for instance-level templates.

  Requires `settings_use_custom_template` to be true (enterprise edition).
  EOM

  default = null
}

variable "settings_import_url" {
  type        = string
  description = <<-EOM
  Git URL to a repository to be imported. Together with `settings_mirror = true`
  it will setup a Pull Mirror.

  This can also be used together with `settings_forked_from_project_id` to
  setup a Pull Mirror for a fork.

  The fork takes precedence over the import.

  Make sure to provide the credentials in `settings_import_url_username` and
  `settings_import_url_password`.

  GitLab never returns the credentials, thus the provider cannot detect
  configuration drift in the credentials.

  They can also not be imported using terraform import.
  EOM

  default = null
}

variable "settings_import_url_password" {
  type        = string
  description = <<-EOM
  The password for the `settings_import_url`. The value of this field is used
  to construct a valid `settings_import_url` and is only related to the provider.

  This field cannot be imported using terraform import.
  EOM

  sensitive = true
  default   = null
}

variable "settings_import_url_username" {
  type        = string
  description = <<-EOM
  The username for the `settings_import_url`. The value of this field is used to
  construct a valid `settings_import_url` and is only related to the provider.

  This field cannot be imported using terraform import.
  EOM

  default = null
}

variable "settings_mirror" {
  type        = bool
  description = "Enable project pull mirror."

  default = null
}

variable "settings_infrastructure_access_level" {
  type        = string
  description = <<-EOM
  Set the infrastructure access level. Valid values are `disabled`, `private`,
  `enabled`.
  EOM

  nullable = false
  default  = "disabled"
}

variable "settings_initialize_with_readme" {
  type        = bool
  description = <<-EOM
  Create main branch with first commit containing a README.md file.

  Must be set to `true` if importing an uninitialized project with a different
  `settings_default_branch`.
  EOM

  nullable = false
  default  = false
}

variable "settings_issues_access_level" {
  type        = string
  description = <<-EOM
  Set the issues access level. Valid values are `disabled`, `private`, `enabled`.
  EOM

  nullable = false
  default  = "disabled"
}

variable "settings_issues_template" {
  type        = string
  description = "Sets the template for new issues in the project."

  default = null
}

variable "settings_keep_latest_artifact" {
  type        = bool
  description = <<-EOM
  Disable or enable the ability to keep the latest artifact for this project.
  EOM

  nullable = false
  default  = false
}

variable "settings_lfs_enabled" {
  type        = bool
  description = "Enable LFS for the project."

  nullable = false
  default  = false
}

variable "settings_merge_commit_template" {
  type        = string
  description = <<-EOM
  Template used to create merge commit message in merge requests.
  EOM

  nullable = false
  default  = <<-EOM
  %%{title} (%%{local_reference})

  %%{description}

  %%{issues}

  %%{reviewed_by}
  %%{approved_by}
  Merged-by: %%{merged_by}

  See merge request %%{url}
  EOM
}

variable "settings_merge_method" {
  type        = string
  description = <<-EOM
  Set the merge method. Valid values are `merge`, `rebase_merge`, `ff`.
  EOM

  nullable = false
  default  = "rebase_merge"
}

variable "settings_merge_pipelines_enabled" {
  type        = bool
  description = "Enable or disable merge pipelines."

  nullable = false
  default  = false
}

variable "settings_merge_requests_access_level" {
  type        = string
  description = <<-EOM
  Set the merge requests access level. Valid values are `disabled`, `private`,
  `enabled`.
  EOM

  nullable = false
  default  = "disabled"
}

variable "settings_merge_requests_template" {
  type        = string
  description = "Sets the template for new merge requests in the project."

  default = null
}

variable "settings_merge_trains_enabled" {
  type        = bool
  description = <<-EOM
  Enable or disable merge trains.

  Requires `settings_merge_pipelines_enabled` to be set to `true` to take effect.
  EOM

  nullable = false
  default  = false
}

variable "settings_mirror_overwrites_diverged_branches" {
  type        = bool
  description = "Enable overwrite diverged branches for a mirrored project."

  nullable = false
  default  = false
}

variable "settings_mirror_trigger_builds" {
  type        = bool
  description = "Enable trigger builds on pushes for a mirrored project."

  nullable = false
  default  = false
}

variable "settings_monitor_access_level" {
  type        = string
  description = <<-EOM
  Set the monitor access level. Valid values are `disabled`, `private`, `enabled`.
  EOM

  nullable = false
  default  = "disabled"
}

variable "settings_mr_default_target_self" {
  type        = bool
  description = <<-EOM
  For forked projects, target merge requests to this project.

  If `false`, the target will be the upstream project.
  EOM

  nullable = false
  default  = false
}

variable "settings_only_allow_merge_if_all_discussions_are_resolved" {
  type        = bool
  description = <<-EOM
  Set to `true` if you want allow merges only if all discussions are resolved.
  EOM

  nullable = false
  default  = true
}

variable "settings_only_allow_merge_if_pipeline_succeeds" {
  type        = bool
  description = <<-EOM
  Set to `false` if you allow merges if a pipeline fails.
  EOM

  nullable = false
  default  = true
}

variable "settings_only_mirror_protected_branches" {
  type        = bool
  description = <<-EOM
  Enable only mirror protected branches for a mirrored project.
  EOM

  nullable = false
  default  = false
}

variable "settings_packages_enabled" {
  type        = bool
  description = "Enable packages repository for the project."

  nullable = false
  default  = false
}

variable "settings_pages_access_level" {
  type        = string
  description = <<-EOM
  Enable pages access control. Valid values are `public`, `private`, `enabled`,
  `disabled`.
  EOM

  nullable = false
  default  = "disabled"
}

variable "settings_printing_merge_request_link_enabled" {
  type        = bool
  description = <<-EOM
  Show/Hide link to create/view merge request when pushing from the command line
  EOM

  nullable = false
  default  = true
}

variable "settings_public_jobs" {
  type        = bool
  description = "If true, jobs can be viewed by non-project members."

  nullable = false
  default  = false
}

variable "settings_releases_access_level" {
  type        = string
  description = <<-EOM
  Set the releases access level. Valid values are `disabled`, `private`, `enabled`.
  EOM

  nullable = false
  default  = "disabled"
}

variable "settings_remove_source_branch_after_merge" {
  type        = bool
  description = <<-EOM
  Enable Delete source branch option by default for all new merge requests.
  EOM

  nullable = false
  default  = true
}

variable "settings_repository_access_level" {
  type        = string
  description = <<-EOM
  Set the repository access level. Valid values are `disabled`, `private`, `enabled`.
  EOM

  nullable = false
  default  = "private"
}

variable "settings_repository_storage" {
  type        = string
  description = <<-EOM
  Which storage shard the repository is on. (administrator only)
  EOM

  default = null
}

variable "settings_request_access_enabled" {
  type        = bool
  description = "Allow users to request member access."

  nullable = false
  default  = false
}

variable "settings_requirements_access_level" {
  type        = string
  description = <<-EOM
  Set the requirements access level. Valid values are `disabled`, `private`, `enabled`.
  EOM

  nullable = false
  default  = "disabled"
}

variable "settings_resolve_outdated_diff_discussions" {
  type        = bool
  description = <<-EOM
  Automatically resolve merge request diffs discussions on lines changed with a push.
  EOM

  nullable = false
  default  = false
}

variable "settings_restrict_user_defined_variables" {
  type        = bool
  description = <<-EOM
  Allow only users with the Maintainer role to pass user-defined variables when
  triggering a pipeline.
  EOM

  nullable = false
  default  = true
}

variable "settings_security_and_compliance_access_level" {
  type        = string
  description = <<-EOM
  Set the security and compliance access level. Valid values are `disabled`,
  `private`, `enabled`.
  EOM

  nullable = false
  default  = "disabled"
}

variable "settings_shared_runners_enabled" {
  type        = bool
  description = "Enable shared runners for this project."

  nullable = false
  default  = false
}

variable "settings_skip_wait_for_default_branch_protection" {
  type        = bool
  description = <<-EOM
  If `true`, the default behavior to wait for the default branch protection to
  be created is skipped.

  This is necessary if the current user is not an admin and the default branch
  protection is disabled on an instance-level.

  There is currently no known way to determine if the default branch protection
  is disabled on an instance-level for non-admin users.

  This attribute is only used during resource creation, thus changes are
  suppressed and the attribute cannot be imported.
  EOM

  default = null
}

variable "settings_snippets_access_level" {
  type        = string
  description = <<-EOM
  Set the snippets access level. Valid values are `disabled`, `private`, `enabled`.
  EOM

  nullable = false
  default  = "disabled"
}

variable "settings_squash_commit_template" {
  type        = string
  description = <<-EOM
  Template used to create squash commit message in merge requests.
  EOM

  nullable = false
  default  = <<-EOM
  %%{title} (%%{local_reference})

  %%{description}

  %%{issues}

  %%{reviewed_by}
  %%{approved_by}
  Merged-by: %%{merged_by}

  See merge request %%{url}
  EOM
}

variable "settings_squash_option" {
  type        = string
  description = <<-EOM
  Squash commits when merge request. Valid values are `never`, `always`,
  `default_on`, or `default_off`.
  EOM

  nullable = false
  default  = "never"
}

variable "settings_suggestion_commit_message" {
  type        = string
  description = <<-EOM
  The commit message used to apply merge request suggestions.
  EOM

  default = null
}

variable "settings_template_name" {
  type        = string
  description = <<-EOM
  When used without `settings_use_custom_template`, name of a built-in project
  template. When used with `settings_use_custom_template`, name of a custom
  project template.

  This option is mutually exclusive with `settings_template_project_id`.
  EOM

  default = null
}

variable "settings_template_project_id" {
  type        = number
  description = <<-EOM
  When used with `settings_use_custom_template`, project ID of a custom project
  template.

  This is preferable to using `settings_template_name` since
  `settings_template_name` may be ambiguous (enterprise edition).

  This option is mutually exclusive with `settings_template_name`.

  See [gitlab_group_project_file_template](https://registry.terraform.io/providers/gitlabhq/gitlab/latest/docs/resources/group_project_file_template)
  to set a project as a template project.

  If a project has not been set as a template, using it here will result in an error.
  EOM

  default = null
}

variable "settings_timeouts" {
  type = object({
    create = string
    delete = string
  })
  description = <<-EOM
  Object with following attributes:

  * `create`: String
  * `delete`: String

  Note: At the time of writing, not so much information about this resource
  variable. See [Gitlab Project Resources - Timeouts](https://registry.terraform.io/providers/gitlabhq/gitlab/latest/docs/resources/project#timeouts)
  EOM

  default = null
}

variable "settings_topics" {
  type        = set(string)
  description = "The list of topics for the project."

  nullable = false
  default  = []
}

variable "settings_visibility_level" {
  type        = string
  description = <<-EOM
  Set to `public` to create a public project. Valid values are `private`,
  `internal`, `public`.
  EOM

  nullable = false
  default  = "private"
}

variable "settings_wiki_access_level" {
  type        = string
  description = <<-EOM
  Set the wiki access level. Valid values are `disabled`, `private`, `enabled`.
  EOM

  nullable = false
  default  = "disabled"
}