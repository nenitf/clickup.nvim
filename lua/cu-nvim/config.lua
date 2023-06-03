local default_env = {
  api_token = "pk_userid_etc",
  user_id = "userid",
  default_space = "spaceid",
  default_workspace = "workspaceid",
  default_filters = {
    statuses = {
      "ready for development",
      "backlog",
      "code review",
      "in development",
    },
  },
}

return {
  env = default_env
}
