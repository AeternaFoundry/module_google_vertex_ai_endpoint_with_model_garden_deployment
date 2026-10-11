output "vertex_ai_endpoint_with_model_garden_deployments_id" {
  description = "Map of id values across all vertex_ai_endpoint_with_model_garden_deployments, keyed the same as var.vertex_ai_endpoint_with_model_garden_deployments except keys with no id are omitted"
  value       = { for k, v in google_vertex_ai_endpoint_with_model_garden_deployment.vertex_ai_endpoint_with_model_garden_deployments : k => v.id if v.id != null && length(v.id) > 0 }
}
output "vertex_ai_endpoint_with_model_garden_deployments_deletion_policy" {
  description = "Map of deletion_policy values across all vertex_ai_endpoint_with_model_garden_deployments, keyed the same as var.vertex_ai_endpoint_with_model_garden_deployments except keys with no deletion_policy are omitted"
  value       = { for k, v in google_vertex_ai_endpoint_with_model_garden_deployment.vertex_ai_endpoint_with_model_garden_deployments : k => v.deletion_policy if v.deletion_policy != null && length(v.deletion_policy) > 0 }
}
output "vertex_ai_endpoint_with_model_garden_deployments_deploy_config" {
  description = "Map of deploy_config values across all vertex_ai_endpoint_with_model_garden_deployments, keyed the same as var.vertex_ai_endpoint_with_model_garden_deployments except keys with no deploy_config are omitted"
  value       = { for k, v in google_vertex_ai_endpoint_with_model_garden_deployment.vertex_ai_endpoint_with_model_garden_deployments : k => one(v.deploy_config) if v.deploy_config != null && length(v.deploy_config) > 0 }
}
output "vertex_ai_endpoint_with_model_garden_deployments_deployed_model_display_name" {
  description = "Map of deployed_model_display_name values across all vertex_ai_endpoint_with_model_garden_deployments, keyed the same as var.vertex_ai_endpoint_with_model_garden_deployments except keys with no deployed_model_display_name are omitted"
  value       = { for k, v in google_vertex_ai_endpoint_with_model_garden_deployment.vertex_ai_endpoint_with_model_garden_deployments : k => v.deployed_model_display_name if v.deployed_model_display_name != null && length(v.deployed_model_display_name) > 0 }
}
output "vertex_ai_endpoint_with_model_garden_deployments_deployed_model_id" {
  description = "Map of deployed_model_id values across all vertex_ai_endpoint_with_model_garden_deployments, keyed the same as var.vertex_ai_endpoint_with_model_garden_deployments except keys with no deployed_model_id are omitted"
  value       = { for k, v in google_vertex_ai_endpoint_with_model_garden_deployment.vertex_ai_endpoint_with_model_garden_deployments : k => v.deployed_model_id if v.deployed_model_id != null && length(v.deployed_model_id) > 0 }
}
output "vertex_ai_endpoint_with_model_garden_deployments_endpoint" {
  description = "Map of endpoint values across all vertex_ai_endpoint_with_model_garden_deployments, keyed the same as var.vertex_ai_endpoint_with_model_garden_deployments except keys with no endpoint are omitted"
  value       = { for k, v in google_vertex_ai_endpoint_with_model_garden_deployment.vertex_ai_endpoint_with_model_garden_deployments : k => v.endpoint if v.endpoint != null && length(v.endpoint) > 0 }
}
output "vertex_ai_endpoint_with_model_garden_deployments_endpoint_config" {
  description = "Map of endpoint_config values across all vertex_ai_endpoint_with_model_garden_deployments, keyed the same as var.vertex_ai_endpoint_with_model_garden_deployments except keys with no endpoint_config are omitted"
  value       = { for k, v in google_vertex_ai_endpoint_with_model_garden_deployment.vertex_ai_endpoint_with_model_garden_deployments : k => one(v.endpoint_config) if v.endpoint_config != null && length(v.endpoint_config) > 0 }
}
output "vertex_ai_endpoint_with_model_garden_deployments_hugging_face_model_id" {
  description = "Map of hugging_face_model_id values across all vertex_ai_endpoint_with_model_garden_deployments, keyed the same as var.vertex_ai_endpoint_with_model_garden_deployments except keys with no hugging_face_model_id are omitted"
  value       = { for k, v in google_vertex_ai_endpoint_with_model_garden_deployment.vertex_ai_endpoint_with_model_garden_deployments : k => v.hugging_face_model_id if v.hugging_face_model_id != null && length(v.hugging_face_model_id) > 0 }
}
output "vertex_ai_endpoint_with_model_garden_deployments_location" {
  description = "Map of location values across all vertex_ai_endpoint_with_model_garden_deployments, keyed the same as var.vertex_ai_endpoint_with_model_garden_deployments except keys with no location are omitted"
  value       = { for k, v in google_vertex_ai_endpoint_with_model_garden_deployment.vertex_ai_endpoint_with_model_garden_deployments : k => v.location if v.location != null && length(v.location) > 0 }
}
output "vertex_ai_endpoint_with_model_garden_deployments_model_config" {
  description = "Map of model_config values across all vertex_ai_endpoint_with_model_garden_deployments, keyed the same as var.vertex_ai_endpoint_with_model_garden_deployments except keys with no model_config are omitted"
  value       = { for k, v in google_vertex_ai_endpoint_with_model_garden_deployment.vertex_ai_endpoint_with_model_garden_deployments : k => one(v.model_config) if v.model_config != null && length(v.model_config) > 0 }
}
output "vertex_ai_endpoint_with_model_garden_deployments_project" {
  description = "Map of project values across all vertex_ai_endpoint_with_model_garden_deployments, keyed the same as var.vertex_ai_endpoint_with_model_garden_deployments except keys with no project are omitted"
  value       = { for k, v in google_vertex_ai_endpoint_with_model_garden_deployment.vertex_ai_endpoint_with_model_garden_deployments : k => v.project if v.project != null && length(v.project) > 0 }
}
output "vertex_ai_endpoint_with_model_garden_deployments_publisher_model_name" {
  description = "Map of publisher_model_name values across all vertex_ai_endpoint_with_model_garden_deployments, keyed the same as var.vertex_ai_endpoint_with_model_garden_deployments except keys with no publisher_model_name are omitted"
  value       = { for k, v in google_vertex_ai_endpoint_with_model_garden_deployment.vertex_ai_endpoint_with_model_garden_deployments : k => v.publisher_model_name if v.publisher_model_name != null && length(v.publisher_model_name) > 0 }
}

