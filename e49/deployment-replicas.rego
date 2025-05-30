package k8srequiredreplicas

object_name = input.review.object.metadata.name
object_kind = input.review.object.kind

violation[{"msg": msg}] {
  spec := input.review.object.spec
  not input_replica_count(spec)
  msg := sprintf("Deployment %v must have at least 3 replicas", [object_name])
}

input_replica_count(spec) {
  spec.replicas >= 3
}