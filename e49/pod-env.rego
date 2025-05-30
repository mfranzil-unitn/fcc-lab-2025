package k8srequiredlabels

violation[{"msg": msg, "details": {"missing_env_label": missing}}] {
  provided := {label | input.review.object.metadata.labels[label]}
  required := {"env"}
  missing := required - provided
  count(missing) > 0
  msg := sprintf("missing required labels: %v", [missing])
}