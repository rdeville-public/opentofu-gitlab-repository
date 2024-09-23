<!-- BEGIN DOTGIT-SYNC BLOCK MANAGED -->
# 👋 Welcome to OpenTofu Module Gitlab Repository

<center>

> ⚠️ IMPORTANT !
>
> Main repo is on [framagit.org](https://framagit.org/rdeville-public/terraform/module-gitlab-repository).
>
> On other online git platforms, they are just mirror of the main repo.
>
> Any issues, pull/merge requests, etc., might not be considered on those other
> platforms.

</center>

---

<center>

[![Licenses: (MIT OR BEERWARE)][license_badge]][license_url]
[![Changelog][changelog_badge]][changelog_badge_url]
[![Build][build_badge]][build_badge_url]
[![Release][release_badge]][release_badge_url]

</center>

[build_badge]: https://framagit.org/rdeville-public/terraform/module-gitlab-repository/badges/main/pipeline.svg
[build_badge_url]: https://framagit.org/rdeville-public/terraform/module-gitlab-repository/-/commits/main
[release_badge]: https://framagit.org/rdeville-public/terraform/module-gitlab-repository/-/badges/release.svg
[release_badge_url]: https://framagit.org/rdeville-public/terraform/module-gitlab-repository/-/releases/
[license_badge]: https://img.shields.io/badge/Licenses-MIT%20OR%20BEERWARE-blue
[license_url]: https://framagit.org/rdeville-public/terraform/module-gitlab-repository/blob/main/LICENSE
[changelog_badge]: https://img.shields.io/badge/Changelog-Python%20Semantic%20Release-yellow
[changelog_badge_url]: https://github.com/python-semantic-release/python-semantic-release

OpenTofu module allowing to manage gitlab repository configuration.

---
<!-- BEGIN DOTGIT-SYNC BLOCK EXCLUDED CUSTOM_README -->
## 🚀 Usage

### Manage Repository (also called Project in Gitlab)

```hcl
module "gitlab_group" {
  source = "git::https://framagit.org/rdeville-public/terraform/module-gitlab-repository.git"

  # Required Variables
  name        = "My Awesome Project"
  description = "The best project of all time"
}
```

### Manage Repository with all settings

```hcl
module "gitlab_group" {
  source = "git::https://framagit.org/rdeville-public/terraform/module-gitlab-repository.git"

  # Required Variables
  name        = "My Awesome Project"
  description = "The best project of all time"

  # Example values
  path         = "my-awesome-project"

  # Default values
  # When null, namespace_id is set to the user applying the module
  namespace_id = null
  # Most of the options are set to false, most access level are set "disabled"
  # by default and must explicitly be enabled in order to achieve the policy of
  # least access
  default_branch                                   = "main"
  allow_merge_on_skipped_pipeline                  = true
  analytics_access_level                           = "disabled"
  approvals_before_merge                           = 1
  archive_on_destroy                               = false
  archived                                         = false
  auto_cancel_pending_pipelines                    = "enabled"
  auto_devops_deploy_strategy                      = "manual"
  auto_devops_enabled                              = false
  autoclose_referenced_issues                      = true
  avatar                                           = null
  build_git_strategy                               = "fetch"
  build_timeout                                    = 3600
  builds_access_level                              = "disabled"
  ci_config_path                                   = ".gitlab-ci.yml"
  ci_default_git_depth                             = 20
  ci_forward_deployment_enabled                    = true
  ci_restrict_pipeline_cancellation_role           = "no one"
  ci_separated_caches                              = true
  container_expiration_policy                      = {}
  container_registry_access_level                  = "disabled"
  emails_enabled                                   = false
  environments_access_level                        = "disabled"
  external_authorization_classification_label      = "TODO::To Classify"
  feature_flags_access_level                       = "disabled"
  forked_from_project_id                           = null
  forking_access_level                             = "disabled"
  group_runners_enabled                            = false
  use_custom_template                              = null
  group_with_project_templates_id                  = null
  import_url                                       = null
  import_url_password                              = null
  import_url_username                              = null
  mirror                                           = null
  infrastructure_access_level                      = "disabled"
  initialize_with_readme                           = false
  issues_access_level                              = "disabled"
  issues_template                                  = null
  keep_latest_artifact                             = false
  lfs_enabled                                      = false
  merge_commit_template                            = <<-EOM
  %%{title} (%%{local_reference})

  %%{description}

  %%{issues}

  %%{reviewed_by}
  %%{approved_by}
  Merged-by: %%{merged_by}

  See merge request %%{url}
  EOM
  merge_method                                     = "rebase_merge"
  merge_pipelines_enabled                          = false
  merge_requests_access_level                      = "disabled"
  merge_requests_template                          = null
  merge_trains_enabled                             = false
  mirror_overwrites_diverged_branches              = false
  mirror_trigger_builds                            = false
  monitor_access_level                             = "disabled"
  mr_default_target_self                           = false
  only_allow_merge_if_all_discussions_are_resolved = true
  only_allow_merge_if_pipeline_succeeds            = true
  only_mirror_protected_branches                   = false
  packages_enabled                                 = false
  pages_access_level                               = "disabled"
  printing_merge_request_link_enabled              = true
  public_jobs                                      = false
  releases_access_level                            = "disabled"
  remove_source_branch_after_merge                 = true
  repository_access_level                          = "private"
  repository_storage                               = null
  request_access_enabled                           = false
  requirements_access_level                        = "disabled"
  resolve_outdated_diff_discussions                = false
  restrict_user_defined_variables                  = true
  security_and_compliance_access_level             = "disabled"
  shared_runners_enabled                           = false
  skip_wait_for_default_branch_protection          = null
  snippets_access_level                            = "disabled"
  squash_commit_template                           = <<-EOM
  %%{title} (%%{local_reference})

  %%{description}

  %%{issues}

  %%{reviewed_by}
  %%{approved_by}
  Merged-by: %%{merged_by}

  See merge request %%{url}
  EOM
  squash_option                                    = "never"
  suggestion_commit_message                        = null
  template_name                                    = null
  template_project_id                              = null
  topics                                           = []
  visibility_level                                 = "private"
  wiki_access_level                                = "disabled"
}
```

### Manage Repository branches protection

```hcl
module "gitlab_group" {
  source = "git::https://framagit.org/rdeville-public/terraform/module-gitlab-repository.git"

  # Required Variables
  name        = "My Awesome Project"
  description = "The best project of all time"

  # Example values
  branches_protection = {
    "main" = {
      # Below are default values
      allow_force_push             = false
      code_owner_approval_required = false
      merge_access_level           = "maintainer"
      push_access_level            = "no one"
      unprotect_access_level       = "admin"
      # Below are example values using all possible variables
      allowed_to_merge = {
        user_id = [
          "1234",
        ]
        group_id = [
          "9876"
        ]
      }
      allowed_to_push = {
        user_id = [
          "1234",
        ]
        group_id = [
          "9876"
        ]
      }
      allowed_to_unprotect = {
        user_id = [
          "1234",
        ]
        group_id = [
          "9876"
        ]
      }
    }
  }
}
```

### Manage Repository tags protection

```hcl
module "gitlab_group" {
  source = "git::https://framagit.org/rdeville-public/terraform/module-gitlab-repository.git"

  # Required Variables
  name        = "My Awesome Project"
  description = "The best project of all time"

  # Example values
  tags_protection = {
    "v*" = {
      # Below are default values
      create_access_level = "maintainer"
      # Below are example values using all possible variables
      allowed_to_create = {
        user_id = [
          "1234",
        ]
        group_id = [
          "9876"
        ]
      }
    }
  }
}
```

### Manage Repository labels

```hcl
module "gitlab_group" {
  source = "git::https://framagit.org/rdeville-public/terraform/module-gitlab-repository.git"

  # Required Variables
  name        = "My Awesome Project"
  description = "The best project of all time"

  # Example values
  labels = {
    "TODO::Classify" = {
      colors      = "#FF0000"
      description = "Issues or MR that need to be classified"
    }
    "TODO::Assign" = {
      colors      = "#DD0000"
      description = "Issues or MR that need to be assigned to somebody"
    }
  }
}
```

### Manage Repository variables accessed by gitlab CI

```hcl
module "gitlab_group" {
  source = "git::https://framagit.org/rdeville-public/terraform/module-gitlab-repository.git"

  # Required Variables
  name        = "My Awesome Project"
  description = "The best project of all time"

  # Example values
  labels = {
    # Minimal example
    "VAR_NAME" = {
      value       = "foo"
      description = "This is an example description"
    }
    # Using all variable parameter with default values
    "ANOTHER_VAR_NAME" = {
      value             = "bar"
      description       = "This is another example description"
      environment_scope = "*"
      masked            = false
      protected         = false
      raw               = false
      variable_type     = "env_var"
    }
  }
}
```

<!-- BEGIN TF-DOCS -->
## ⚙️ Module Content

<details><summary>Click to reveal</summary>

### Table of Content

* [Requirements](#requirements)
* [Resources](#resources)
* [Inputs](#inputs)
  * [Required Inputs](#required-inputs)
  * [Optional Inputs](#optional-inputs)
* [Outputs](#outputs)

### Requirements

* [opentofu](https://opentofu.org/docs/):
  `>= 1.8, < 2.0`
* [gitlab](https://registry.terraform.io/providers/gitlabhq/gitlab/):
  `~>17.0`

### Resources

* [resource.gitlab_branch_protection.this](https://registry.terraform.io/providers/gitlabhq/gitlab/latest/docs/resources/branch_protection)
  > Manage gitlab repository branch protection rules
* [resource.gitlab_project.this](https://registry.terraform.io/providers/gitlabhq/gitlab/latest/docs/resources/project)
  > Manage gitlab repository
* [resource.gitlab_project_label.this](https://registry.terraform.io/providers/gitlabhq/gitlab/latest/docs/resources/project_label)
  > Manage repo labels for issues and merge requests
* [resource.gitlab_project_variable.this](https://registry.terraform.io/providers/gitlabhq/gitlab/latest/docs/resources/project_variable)
  > Manage repo variables accessible for CI
* [resource.gitlab_tag_protection.this](https://registry.terraform.io/providers/gitlabhq/gitlab/latest/docs/resources/tag_protection)
  > Manage gitlab repository branch protection rules

<!-- markdownlint-capture -->
### Inputs

<!-- markdownlint-disable -->
#### Required Inputs

* [settings_name](#settings_name)
* [settings_description](#settings_description)
* [variables](#variables)

##### `settings_name`

The name of the project.
<div style="display:inline-block;width:100%;">
<div style="float:left;border-color:#FFFFFF;width:75%;">
<details><summary>Type</summary>

```hcl
string
```

</details>
</div>
</div>

##### `settings_description`

A description of the project.
<div style="display:inline-block;width:100%;">
<div style="float:left;border-color:#FFFFFF;width:75%;">
<details><summary>Type</summary>

```hcl
string
```

</details>
</div>
</div>

##### `variables`

Map of object, where key is the variables key/name. Object describes variable
and support following attributes:


* `value`: String, the value of the variable.
* `description`: String, the description of the variable.
* `environment_scope`: String, optional, the environment scope of the variable.
  Defaults to all environment `*`.

  Note: In Community Editions of Gitlab, values other than * will cause
  inconsistent plans.
* `masked`: Boolean, optional, if set to `true`, the value of the variable
  will be hidden in job logs. The value must meet the masking requirements.
  Defaults to `false`.
* `protected`: Boolea, optional, if set to `true`, the variable will be passed
  only to pipelines running on protected branches and tags. Defaults to `false`.
* `raw`: Boolean, optional, whether the variable is treated as a raw string.
  When `true`, variables in the value are not expanded. Default to `false`.
* `variable_type`: String, optional, the type of a variable.
  Valid values are: `env_var, :`file`. Default is `env_var`.


<div style="display:inline-block;width:100%;">
<div style="float:left;border-color:#FFFFFF;width:75%;">
<details><summary>Type</summary>

```hcl
map(object({
    value             = string
    description       = string
    environment_scope = optional(string, "*")
    masked            = optional(bool, false)
    protected         = optional(bool, false)
    raw               = optional(bool, false)
    variable_type     = optional(string, "env_var")
  }))
```

</details>
</div>
</div>

#### Optional Inputs

* [settings_path](#settings_path)
* [settings_namespace_id](#settings_namespace_id)
* [settings_default_branch](#settings_default_branch)
* [settings_allow_merge_on_skipped_pipeline](#settings_allow_merge_on_skipped_pipeline)
* [settings_analytics_access_level](#settings_analytics_access_level)
* [settings_approvals_before_merge](#settings_approvals_before_merge)
* [settings_archive_on_destroy](#settings_archive_on_destroy)
* [settings_archived](#settings_archived)
* [settings_auto_cancel_pending_pipelines](#settings_auto_cancel_pending_pipelines)
* [settings_auto_devops_deploy_strategy](#settings_auto_devops_deploy_strategy)
* [settings_auto_devops_enabled](#settings_auto_devops_enabled)
* [settings_autoclose_referenced_issues](#settings_autoclose_referenced_issues)
* [settings_avatar](#settings_avatar)
* [settings_build_git_strategy](#settings_build_git_strategy)
* [settings_build_timeout](#settings_build_timeout)
* [settings_builds_access_level](#settings_builds_access_level)
* [settings_ci_config_path](#settings_ci_config_path)
* [settings_ci_default_git_depth](#settings_ci_default_git_depth)
* [settings_ci_forward_deployment_enabled](#settings_ci_forward_deployment_enabled)
* [settings_ci_restrict_pipeline_cancellation_role](#settings_ci_restrict_pipeline_cancellation_role)
* [settings_ci_separated_caches](#settings_ci_separated_caches)
* [settings_container_expiration_policy](#settings_container_expiration_policy)
* [settings_container_registry_access_level](#settings_container_registry_access_level)
* [settings_emails_enabled](#settings_emails_enabled)
* [settings_environments_access_level](#settings_environments_access_level)
* [settings_external_authorization_classification_label](#settings_external_authorization_classification_label)
* [settings_feature_flags_access_level](#settings_feature_flags_access_level)
* [settings_forked_from_project_id](#settings_forked_from_project_id)
* [settings_forking_access_level](#settings_forking_access_level)
* [settings_group_runners_enabled](#settings_group_runners_enabled)
* [settings_use_custom_template](#settings_use_custom_template)
* [settings_group_with_project_templates_id](#settings_group_with_project_templates_id)
* [settings_import_url](#settings_import_url)
* [settings_import_url_password](#settings_import_url_password)
* [settings_import_url_username](#settings_import_url_username)
* [settings_mirror](#settings_mirror)
* [settings_infrastructure_access_level](#settings_infrastructure_access_level)
* [settings_initialize_with_readme](#settings_initialize_with_readme)
* [settings_issues_access_level](#settings_issues_access_level)
* [settings_issues_template](#settings_issues_template)
* [settings_keep_latest_artifact](#settings_keep_latest_artifact)
* [settings_lfs_enabled](#settings_lfs_enabled)
* [settings_merge_commit_template](#settings_merge_commit_template)
* [settings_merge_method](#settings_merge_method)
* [settings_merge_pipelines_enabled](#settings_merge_pipelines_enabled)
* [settings_merge_requests_access_level](#settings_merge_requests_access_level)
* [settings_merge_requests_template](#settings_merge_requests_template)
* [settings_merge_trains_enabled](#settings_merge_trains_enabled)
* [settings_mirror_overwrites_diverged_branches](#settings_mirror_overwrites_diverged_branches)
* [settings_mirror_trigger_builds](#settings_mirror_trigger_builds)
* [settings_monitor_access_level](#settings_monitor_access_level)
* [settings_mr_default_target_self](#settings_mr_default_target_self)
* [settings_only_allow_merge_if_all_discussions_are_resolved](#settings_only_allow_merge_if_all_discussions_are_resolved)
* [settings_only_allow_merge_if_pipeline_succeeds](#settings_only_allow_merge_if_pipeline_succeeds)
* [settings_only_mirror_protected_branches](#settings_only_mirror_protected_branches)
* [settings_packages_enabled](#settings_packages_enabled)
* [settings_pages_access_level](#settings_pages_access_level)
* [settings_printing_merge_request_link_enabled](#settings_printing_merge_request_link_enabled)
* [settings_public_jobs](#settings_public_jobs)
* [settings_releases_access_level](#settings_releases_access_level)
* [settings_remove_source_branch_after_merge](#settings_remove_source_branch_after_merge)
* [settings_repository_access_level](#settings_repository_access_level)
* [settings_repository_storage](#settings_repository_storage)
* [settings_request_access_enabled](#settings_request_access_enabled)
* [settings_requirements_access_level](#settings_requirements_access_level)
* [settings_resolve_outdated_diff_discussions](#settings_resolve_outdated_diff_discussions)
* [settings_restrict_user_defined_variables](#settings_restrict_user_defined_variables)
* [settings_security_and_compliance_access_level](#settings_security_and_compliance_access_level)
* [settings_shared_runners_enabled](#settings_shared_runners_enabled)
* [settings_skip_wait_for_default_branch_protection](#settings_skip_wait_for_default_branch_protection)
* [settings_snippets_access_level](#settings_snippets_access_level)
* [settings_squash_commit_template](#settings_squash_commit_template)
* [settings_squash_option](#settings_squash_option)
* [settings_suggestion_commit_message](#settings_suggestion_commit_message)
* [settings_template_name](#settings_template_name)
* [settings_template_project_id](#settings_template_project_id)
* [settings_timeouts](#settings_timeouts)
* [settings_topics](#settings_topics)
* [settings_visibility_level](#settings_visibility_level)
* [settings_wiki_access_level](#settings_wiki_access_level)
* [branches_protection](#branches_protection)
* [tags_protection](#tags_protection)
* [labels](#labels)


##### `settings_path`

The path of the repository, will be set to `settings_name` if not provided.

<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  string
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  null
  ```

  </div>
</details>

##### `settings_namespace_id`

The namespace group or user of the project. Defaults to the user using this


<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  number
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  null
  ```

  </div>
</details>

##### `settings_default_branch`

The default branch for the project.
<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  string
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  main
  ```

  </div>
</details>

##### `settings_allow_merge_on_skipped_pipeline`

Set to `false` if you do not want to treat skipped pipelines as if they
finished with success.

<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  bool
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  true
  ```

  </div>
</details>

##### `settings_analytics_access_level`

Set the analytics access level. Valid values are `disabled`, `private`, `enabled`.

<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  string
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  disabled
  ```

  </div>
</details>

##### `settings_approvals_before_merge`

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

<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  number
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  1
  ```

  </div>
</details>

##### `settings_archive_on_destroy`

Set to `true` to archive the project instead of deleting on destroy.

If set to `true` it will entire omit the DELETE operation.

<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  bool
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  false
  ```

  </div>
</details>

##### `settings_archived`

Whether the project is in read-only mode (archived).

Repositories can be archived/unarchived by toggling this parameter.

<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  bool
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  false
  ```

  </div>
</details>

##### `settings_auto_cancel_pending_pipelines`

Auto-cancel pending pipelines. This isn’t a boolean, but `enabled/disabled`.

<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  string
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  enabled
  ```

  </div>
</details>

##### `settings_auto_devops_deploy_strategy`

Auto Deploy strategy. Valid values are `continuous`, `manual`,
`timed_incremental`.

<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  string
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  manual
  ```

  </div>
</details>

##### `settings_auto_devops_enabled`

Enable Auto DevOps for this project.
<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  bool
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  false
  ```

  </div>
</details>

##### `settings_autoclose_referenced_issues`

Set whether auto-closing referenced issues on default branch.
<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  bool
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  true
  ```

  </div>
</details>

##### `settings_avatar`

A local path to the avatar image to upload.

Note: not available for imported resources.

<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  string
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  null
  ```

  </div>
</details>

##### `settings_build_git_strategy`

The Git strategy. Defaults to fetch. Valid values are `clone`, `fetch`.

<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  string
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  fetch
  ```

  </div>
</details>

##### `settings_build_timeout`

The maximum amount of time, in seconds, that a job can run.
<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  number
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  3600
  ```

  </div>
</details>

##### `settings_builds_access_level`

Set the builds access level. Valid values are `disabled`, `private`, `enabled`.

<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  string
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  disabled
  ```

  </div>
</details>

##### `settings_ci_config_path`

Custom Path to CI config file.
<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  string
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  .gitlab-ci.yml
  ```

  </div>
</details>

##### `settings_ci_default_git_depth`

Default number of revisions for shallow cloning.
<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  number
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  20
  ```

  </div>
</details>

##### `settings_ci_forward_deployment_enabled`

When a new deployment job starts, skip older deployment jobs that are still
pending.

<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  bool
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  true
  ```

  </div>
</details>

##### `settings_ci_restrict_pipeline_cancellation_role`

The role required to cancel a pipeline or job. Valid values are `developer`,
`maintainer`, `no one`.

Note: Introduced in GitLab 16.8. Premium and Ultimate only.

<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  string
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  no one
  ```

  </div>
</details>

##### `settings_ci_separated_caches`

Use separate caches for protected branches.
<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  bool
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  true
  ```

  </div>
</details>

##### `settings_container_expiration_policy`

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

<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  map(object({
    enabled      = optional(bool, true)
    cadence      = optional(string, "1d")
    keep_n       = optional(string)
    regex_delete = optional(string)
    regex_keep   = optional(string)
    older_than   = optional(string)
  }))
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  {}
  ```

  </div>
</details>

##### `settings_container_registry_access_level`

Set visibility of container registry, for this project. Valid values are
`disabled`, `private`, `enabled`.

<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  string
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  disabled
  ```

  </div>
</details>

##### `settings_emails_enabled`

Enable email notifications.
<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  bool
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  false
  ```

  </div>
</details>

##### `settings_environments_access_level`

Set the environments access level. Valid values are `disabled`, `private`,
`enabled`.

<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  string
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  disabled
  ```

  </div>
</details>

##### `settings_external_authorization_classification_label`

The classification label for the project.
<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  string
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  TODO::To Classify
  ```

  </div>
</details>

##### `settings_feature_flags_access_level`

Set the feature flags access level. Valid values are `disabled`, `private`,
`enabled`.

<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  string
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  disabled
  ```

  </div>
</details>

##### `settings_forked_from_project_id`

The id of the project to fork. During create the project is forked and during
an update the fork relation is changed.

<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  number
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  null
  ```

  </div>
</details>

##### `settings_forking_access_level`

Set the forking access level. Valid values are `disabled`, `private`, `enabled`.

<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  string
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  disabled
  ```

  </div>
</details>

##### `settings_group_runners_enabled`

Enable group runners for this project.
<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  bool
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  false
  ```

  </div>
</details>

##### `settings_use_custom_template`

Use either custom instance or group (with
`settings_group_with_project_templates_id`, project template (enterprise
edition).

~> When using a custom template, Group Tokens won't work. You must use a real
user's Personal Access Token.

<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  bool
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  null
  ```

  </div>
</details>

##### `settings_group_with_project_templates_id`

For group-level custom templates, specifies ID of group from which all the
custom project templates are sourced.

Leave empty for instance-level templates.

Requires `settings_use_custom_template` to be true (enterprise edition).

<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  number
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  null
  ```

  </div>
</details>

##### `settings_import_url`

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

<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  string
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  null
  ```

  </div>
</details>

##### `settings_import_url_password`

The password for the `settings_import_url`. The value of this field is used
to construct a valid `settings_import_url` and is only related to the provider.

This field cannot be imported using terraform import.

<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  string
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  null
  ```

  </div>
</details>

##### `settings_import_url_username`

The username for the `settings_import_url`. The value of this field is used to
construct a valid `settings_import_url` and is only related to the provider.

This field cannot be imported using terraform import.

<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  string
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  null
  ```

  </div>
</details>

##### `settings_mirror`

Enable project pull mirror.
<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  bool
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  null
  ```

  </div>
</details>

##### `settings_infrastructure_access_level`

Set the infrastructure access level. Valid values are `disabled`, `private`,
`enabled`.

<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  string
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  disabled
  ```

  </div>
</details>

##### `settings_initialize_with_readme`

Create main branch with first commit containing a README.md file.

Must be set to `true` if importing an uninitialized project with a different
`settings_default_branch`.

<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  bool
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  false
  ```

  </div>
</details>

##### `settings_issues_access_level`

Set the issues access level. Valid values are `disabled`, `private`, `enabled`.

<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  string
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  disabled
  ```

  </div>
</details>

##### `settings_issues_template`

Sets the template for new issues in the project.
<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  string
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  null
  ```

  </div>
</details>

##### `settings_keep_latest_artifact`

Disable or enable the ability to keep the latest artifact for this project.

<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  bool
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  false
  ```

  </div>
</details>

##### `settings_lfs_enabled`

Enable LFS for the project.
<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  bool
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  false
  ```

  </div>
</details>

##### `settings_merge_commit_template`

Template used to create merge commit message in merge requests.

<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  string
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  %{title} (%{local_reference})

%{description}

%{issues}

%{reviewed_by}
%{approved_by}
Merged-by: %{merged_by}

See merge request %{url}

  ```

  </div>
</details>

##### `settings_merge_method`

Set the merge method. Valid values are `merge`, `rebase_merge`, `ff`.

<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  string
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  rebase_merge
  ```

  </div>
</details>

##### `settings_merge_pipelines_enabled`

Enable or disable merge pipelines.
<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  bool
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  false
  ```

  </div>
</details>

##### `settings_merge_requests_access_level`

Set the merge requests access level. Valid values are `disabled`, `private`,
`enabled`.

<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  string
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  disabled
  ```

  </div>
</details>

##### `settings_merge_requests_template`

Sets the template for new merge requests in the project.
<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  string
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  null
  ```

  </div>
</details>

##### `settings_merge_trains_enabled`

Enable or disable merge trains.

Requires `settings_merge_pipelines_enabled` to be set to `true` to take effect.

<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  bool
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  false
  ```

  </div>
</details>

##### `settings_mirror_overwrites_diverged_branches`

Enable overwrite diverged branches for a mirrored project.
<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  bool
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  false
  ```

  </div>
</details>

##### `settings_mirror_trigger_builds`

Enable trigger builds on pushes for a mirrored project.
<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  bool
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  false
  ```

  </div>
</details>

##### `settings_monitor_access_level`

Set the monitor access level. Valid values are `disabled`, `private`, `enabled`.

<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  string
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  disabled
  ```

  </div>
</details>

##### `settings_mr_default_target_self`

For forked projects, target merge requests to this project.

If `false`, the target will be the upstream project.

<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  bool
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  false
  ```

  </div>
</details>

##### `settings_only_allow_merge_if_all_discussions_are_resolved`

Set to `true` if you want allow merges only if all discussions are resolved.

<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  bool
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  true
  ```

  </div>
</details>

##### `settings_only_allow_merge_if_pipeline_succeeds`

Set to `false` if you allow merges if a pipeline fails.

<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  bool
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  true
  ```

  </div>
</details>

##### `settings_only_mirror_protected_branches`

Enable only mirror protected branches for a mirrored project.

<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  bool
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  false
  ```

  </div>
</details>

##### `settings_packages_enabled`

Enable packages repository for the project.
<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  bool
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  false
  ```

  </div>
</details>

##### `settings_pages_access_level`

Enable pages access control. Valid values are `public`, `private`, `enabled`,
`disabled`.

<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  string
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  disabled
  ```

  </div>
</details>

##### `settings_printing_merge_request_link_enabled`

Show/Hide link to create/view merge request when pushing from the command line

<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  bool
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  true
  ```

  </div>
</details>

##### `settings_public_jobs`

If true, jobs can be viewed by non-project members.
<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  bool
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  false
  ```

  </div>
</details>

##### `settings_releases_access_level`

Set the releases access level. Valid values are `disabled`, `private`, `enabled`.

<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  string
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  disabled
  ```

  </div>
</details>

##### `settings_remove_source_branch_after_merge`

Enable Delete source branch option by default for all new merge requests.

<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  bool
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  true
  ```

  </div>
</details>

##### `settings_repository_access_level`

Set the repository access level. Valid values are `disabled`, `private`, `enabled`.

<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  string
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  private
  ```

  </div>
</details>

##### `settings_repository_storage`

Which storage shard the repository is on. (administrator only)

<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  string
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  null
  ```

  </div>
</details>

##### `settings_request_access_enabled`

Allow users to request member access.
<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  bool
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  false
  ```

  </div>
</details>

##### `settings_requirements_access_level`

Set the requirements access level. Valid values are `disabled`, `private`, `enabled`.

<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  string
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  disabled
  ```

  </div>
</details>

##### `settings_resolve_outdated_diff_discussions`

Automatically resolve merge request diffs discussions on lines changed with a push.

<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  bool
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  false
  ```

  </div>
</details>

##### `settings_restrict_user_defined_variables`

Allow only users with the Maintainer role to pass user-defined variables when
triggering a pipeline.

<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  bool
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  true
  ```

  </div>
</details>

##### `settings_security_and_compliance_access_level`

Set the security and compliance access level. Valid values are `disabled`,
`private`, `enabled`.

<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  string
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  disabled
  ```

  </div>
</details>

##### `settings_shared_runners_enabled`

Enable shared runners for this project.
<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  bool
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  false
  ```

  </div>
</details>

##### `settings_skip_wait_for_default_branch_protection`

If `true`, the default behavior to wait for the default branch protection to
be created is skipped.

This is necessary if the current user is not an admin and the default branch
protection is disabled on an instance-level.

There is currently no known way to determine if the default branch protection
is disabled on an instance-level for non-admin users.

This attribute is only used during resource creation, thus changes are
suppressed and the attribute cannot be imported.

<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  bool
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  null
  ```

  </div>
</details>

##### `settings_snippets_access_level`

Set the snippets access level. Valid values are `disabled`, `private`, `enabled`.

<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  string
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  disabled
  ```

  </div>
</details>

##### `settings_squash_commit_template`

Template used to create squash commit message in merge requests.

<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  string
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  %{title} (%{local_reference})

%{description}

%{issues}

%{reviewed_by}
%{approved_by}
Merged-by: %{merged_by}

See merge request %{url}

  ```

  </div>
</details>

##### `settings_squash_option`

Squash commits when merge request. Valid values are `never`, `always`,
`default_on`, or `default_off`.

<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  string
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  never
  ```

  </div>
</details>

##### `settings_suggestion_commit_message`

The commit message used to apply merge request suggestions.

<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  string
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  null
  ```

  </div>
</details>

##### `settings_template_name`

When used without `settings_use_custom_template`, name of a built-in project
template. When used with `settings_use_custom_template`, name of a custom
project template.

This option is mutually exclusive with `settings_template_project_id`.

<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  string
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  null
  ```

  </div>
</details>

##### `settings_template_project_id`

When used with `settings_use_custom_template`, project ID of a custom project
template.

This is preferable to using `settings_template_name` since
`settings_template_name` may be ambiguous (enterprise edition).

This option is mutually exclusive with `settings_template_name`.

See [gitlab_group_project_file_template](https://registry.terraform.io/providers/gitlabhq/gitlab/latest/docs/resources/group_project_file_template)
to set a project as a template project.

If a project has not been set as a template, using it here will result in an error.

<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  number
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  null
  ```

  </div>
</details>

##### `settings_timeouts`

Object with following attributes:

* `create`: String
* `delete`: String

Note: At the time of writing, not so much information about this resource
variable. See [Gitlab Project Resources - Timeouts](https://registry.terraform.io/providers/gitlabhq/gitlab/latest/docs/resources/project#timeouts)

<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  object({
    create = string
    delete = string
  })
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  null
  ```

  </div>
</details>

##### `settings_topics`

The list of topics for the project.
<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  set(string)
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  []
  ```

  </div>
</details>

##### `settings_visibility_level`

Set to `public` to create a public project. Valid values are `private`,
`internal`, `public`.

<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  string
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  private
  ```

  </div>
</details>

##### `settings_wiki_access_level`

Set the wiki access level. Valid values are `disabled`, `private`, `enabled`.

<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  string
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  disabled
  ```

  </div>
</details>

##### `branches_protection`

Map of object, where the key is the branch name to protect and object is the
branch protection configuration. The object support following attributes:

* `allow_force_push`: Boolean, optional, Can be set to `true `to allow users
  with push access to force push. Default to `false`.
* `code_owner_approval_required`: Boolean, optional, can be set to `true` to
  require code owner approval before merging. Default to `false`.

  NOTE: Only available for Premium and Ultimate instances.
* `merge_access_level`: String, optional, access levels allowed to merge.
  Valid values are: `no one`, `developer`, `maintainer`. Default to
  `maintainer`
* `allowed_to_merge`: Object, optional, sets of user(s)/group(s) allowed to
  merge to protected branch. Default to `null`. Object supports following
  attributes:
  * `group_id`: Set of number, optional, the IDs of GitLab groups allowed to
    perform the relevant action.
  * `user_id`: Set of number, optional, the IDs of GitLab users allowed to
    perform the relevant action.
* `push_access_level`: String, optional, access levels allowed to push. Valid
  values are: `no one`, `developer`, `maintainer`. Default to `no one` forcing
  to pass through merge request.
* `allowed_to_push`: Object, optional, sets of user(s)/group(s) allowed to
  push to protected branch. Default to `null`. Object supports following
  attributes:
  * `group_id`: Set of number, optional, the IDs of GitLab groups allowed to
    perform the relevant action.
  * `user_id`: Set of number, optional, the IDs of GitLab users allowed to
    perform the relevant action.
* `unprotect_access_level`: String, optional, access levels allowed to
  unprotect. Valid values are: `developer`, `maintainer`, `admin`. Default to
  `admin`.
* `allowed_to_unprotect`: Object, optional, sets of user(s)/group(s) allowed to
  unprotect protected branch. Default to `null`. Object supports following
  attributes:
  * `group_id`: Set of number, optional, the IDs of GitLab groups allowed to
    perform the relevant action.
  * `user_id`: Set of number, optional, the IDs of GitLab users allowed to
    perform the relevant action.

<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  map(object({
    # Key is branch name
    allow_force_push             = optional(bool, false)
    code_owner_approval_required = optional(bool, false)
    merge_access_level           = optional(string, "maintainer")
    push_access_level            = optional(string, "no one")
    unprotect_access_level       = optional(string, "admin")
    allowed_to_merge = optional(object({
      user_id  = optional(set(number), [])
      group_id = optional(set(number), [])
    }), {})
    allowed_to_push = optional(object({
      user_id  = optional(set(number), [])
      group_id = optional(set(number), [])
    }), {})
    allowed_to_unprotect = optional(object({
      user_id  = optional(set(number), [])
      group_id = optional(set(number), [])
    }), {})
  }))
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  {}
  ```

  </div>
</details>

##### `tags_protection`

Map of object, where the key is the tag to be protected. Object support
following attributes:

* `create_access_level`: String, optional, access levels allowed to create.
  Default value of `maintainer`.

  The default value is always sent if not provided in the configuration.
  Valid values are: `no one`, `developer`, `maintainer`.
* `allowed_to_create`: Object configuring tag protection rules. The object
  support following attributes:
  * `group_id`: Number, optional, List of Gitlab groups IDs allowed to
    perform the relevant action.
  * `user_id`: Number, optional, List of Gitlab users IDs allowed to
    perform the relevant action.

<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  map(object({
    create_access_level = optional(string, "maintainer")
    allowed_to_create = optional(object({
      user_id  = optional(set(number), [])
      group_id = optional(set(number), [])
    }), {})
  }))
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  {}
  ```

  </div>
</details>

##### `labels`

Map of objects, where key is the label name and the object describe the lable.
Object support the following attributes:

* `color`: String, the color of the label given in 6-digit hex notation with
  leading '#' sign (e.g. #FFAABB) or one of the CSS color names.
* `description`: String, the description of the label.

<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  map(object({
    color       = string
    description = string
  }))
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  {}
  ```

  </div>
</details>
<!-- markdownlint-restore -->

### Outputs

* `repository_id`:
  ID of the deployed repository
* `repository_clone_ssh`:
  SSH Url to clone the deployed repository
* `repository_clone_https`:
  SSH Url to clone the deployed repository
* `repository_web_url`:
  Web Url to the deployed repository

</details>

<!-- END TF-DOCS -->
<!-- END DOTGIT-SYNC BLOCK EXCLUDED CUSTOM_README -->
## 🤝 Contributing

Contributions, issues and feature requests are welcome!

Feel free to check [issues page][issues_pages].

You can also take a look at the [CONTRIBUTING.md][contributing].

[issues_pages]: https://framagit.org/rdeville-public/terraform/module-gitlab-repository/-/issues
[contributing]: https://framagit.org/rdeville-public/terraform/module-gitlab-repository/blob/main/CONTRIBUTING.md

## 👤 Maintainers

* 📧 [**Romain Deville** \<code@romaindeville.fr\>](mailto:code@romaindeville.fr)
  * Website: [https://romaindeville.fr](https://romaindeville.fr)
  * Github: [@rdeville](https://github.com/rdeville)
  * Gitlab: [@r.deville](https://gitlab.com/r.deville)
  * Framagit: [@rdeville](https://framagit.org/rdeville)

## 📝 License

Copyright © 2024 [Romain Deville](code@romaindeville.fr)

This project is under following licenses (**OR**) :

* [MIT][main_license]
* [BEERWARE][beerware_license]

[main_license]: https://framagit.org/rdeville-public/terraform/module-gitlab-repository/blob/main/LICENSE
[beerware_license]: https://framagit.org/rdeville-public/terraform/module-gitlab-repository/blob/main/LICENSE.BEERWARE
<!-- END DOTGIT-SYNC BLOCK MANAGED -->
