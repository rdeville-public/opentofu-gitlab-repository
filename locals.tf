locals {
  variables = merge(
    var.variables,
    merge([
      for name, token in var.access_tokens : token.ci_variable != null ? {
        token.ci_variable.name != null ? token.ci_variable.name : name = merge(
          {
            value = gitlab_project_access_token.this[name].token
          },
          token.ci_variable
        )
      } : null
    ]...)
  )
}
