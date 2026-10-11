resource "google_vertex_ai_endpoint_with_model_garden_deployment" "vertex_ai_endpoint_with_model_garden_deployments" {
  for_each = var.vertex_ai_endpoint_with_model_garden_deployments

  location              = each.value.location
  deletion_policy       = each.value.deletion_policy
  hugging_face_model_id = each.value.hugging_face_model_id
  project               = each.value.project
  publisher_model_name  = each.value.publisher_model_name

  dynamic "deploy_config" {
    for_each = each.value.deploy_config != null ? [each.value.deploy_config] : []
    content {
      dynamic "dedicated_resources" {
        for_each = deploy_config.value.dedicated_resources != null ? [deploy_config.value.dedicated_resources] : []
        content {
          dynamic "autoscaling_metric_specs" {
            for_each = dedicated_resources.value.autoscaling_metric_specs != null ? dedicated_resources.value.autoscaling_metric_specs : []
            content {
              metric_name = autoscaling_metric_specs.value.metric_name
              target      = autoscaling_metric_specs.value.target
            }
          }
          machine_spec {
            accelerator_count        = dedicated_resources.value.machine_spec.accelerator_count
            accelerator_type         = dedicated_resources.value.machine_spec.accelerator_type
            machine_type             = dedicated_resources.value.machine_spec.machine_type
            multihost_gpu_node_count = dedicated_resources.value.machine_spec.multihost_gpu_node_count
            dynamic "reservation_affinity" {
              for_each = dedicated_resources.value.machine_spec.reservation_affinity != null ? [dedicated_resources.value.machine_spec.reservation_affinity] : []
              content {
                key                       = reservation_affinity.value.key
                reservation_affinity_type = reservation_affinity.value.reservation_affinity_type
                values                    = reservation_affinity.value.values
              }
            }
            tpu_topology = dedicated_resources.value.machine_spec.tpu_topology
          }
          max_replica_count      = dedicated_resources.value.max_replica_count
          min_replica_count      = dedicated_resources.value.min_replica_count
          required_replica_count = dedicated_resources.value.required_replica_count
          spot                   = dedicated_resources.value.spot
        }
      }
      fast_tryout_enabled = deploy_config.value.fast_tryout_enabled
      system_labels       = deploy_config.value.system_labels
    }
  }

  dynamic "endpoint_config" {
    for_each = each.value.endpoint_config != null ? [each.value.endpoint_config] : []
    content {
      dedicated_endpoint_enabled = endpoint_config.value.dedicated_endpoint_enabled
      endpoint_display_name      = endpoint_config.value.endpoint_display_name
      dynamic "private_service_connect_config" {
        for_each = endpoint_config.value.private_service_connect_config != null ? [endpoint_config.value.private_service_connect_config] : []
        content {
          enable_private_service_connect = private_service_connect_config.value.enable_private_service_connect
          project_allowlist              = private_service_connect_config.value.project_allowlist
          dynamic "psc_automation_configs" {
            for_each = private_service_connect_config.value.psc_automation_configs != null ? [private_service_connect_config.value.psc_automation_configs] : []
            content {
              network    = psc_automation_configs.value.network
              project_id = psc_automation_configs.value.project_id
            }
          }
        }
      }
    }
  }

  dynamic "model_config" {
    for_each = each.value.model_config != null ? [each.value.model_config] : []
    content {
      accept_eula = model_config.value.accept_eula
      dynamic "container_spec" {
        for_each = model_config.value.container_spec != null ? [model_config.value.container_spec] : []
        content {
          args               = container_spec.value.args
          command            = container_spec.value.command
          deployment_timeout = container_spec.value.deployment_timeout
          dynamic "env" {
            for_each = container_spec.value.env != null ? container_spec.value.env : []
            content {
              name  = env.value.name
              value = env.value.value
            }
          }
          dynamic "grpc_ports" {
            for_each = container_spec.value.grpc_ports != null ? container_spec.value.grpc_ports : []
            content {
              container_port = grpc_ports.value.container_port
            }
          }
          dynamic "health_probe" {
            for_each = container_spec.value.health_probe != null ? [container_spec.value.health_probe] : []
            content {
              dynamic "exec" {
                for_each = health_probe.value.exec != null ? [health_probe.value.exec] : []
                content {
                  command = exec.value.command
                }
              }
              failure_threshold = health_probe.value.failure_threshold
              dynamic "grpc" {
                for_each = health_probe.value.grpc != null ? [health_probe.value.grpc] : []
                content {
                  port    = grpc.value.port
                  service = grpc.value.service
                }
              }
              dynamic "http_get" {
                for_each = health_probe.value.http_get != null ? [health_probe.value.http_get] : []
                content {
                  host = http_get.value.host
                  dynamic "http_headers" {
                    for_each = http_get.value.http_headers != null ? http_get.value.http_headers : []
                    content {
                      name  = http_headers.value.name
                      value = http_headers.value.value
                    }
                  }
                  path   = http_get.value.path
                  port   = http_get.value.port
                  scheme = http_get.value.scheme
                }
              }
              initial_delay_seconds = health_probe.value.initial_delay_seconds
              period_seconds        = health_probe.value.period_seconds
              success_threshold     = health_probe.value.success_threshold
              dynamic "tcp_socket" {
                for_each = health_probe.value.tcp_socket != null ? [health_probe.value.tcp_socket] : []
                content {
                  host = tcp_socket.value.host
                  port = tcp_socket.value.port
                }
              }
              timeout_seconds = health_probe.value.timeout_seconds
            }
          }
          health_route = container_spec.value.health_route
          image_uri    = container_spec.value.image_uri
          dynamic "liveness_probe" {
            for_each = container_spec.value.liveness_probe != null ? [container_spec.value.liveness_probe] : []
            content {
              dynamic "exec" {
                for_each = liveness_probe.value.exec != null ? [liveness_probe.value.exec] : []
                content {
                  command = exec.value.command
                }
              }
              failure_threshold = liveness_probe.value.failure_threshold
              dynamic "grpc" {
                for_each = liveness_probe.value.grpc != null ? [liveness_probe.value.grpc] : []
                content {
                  port    = grpc.value.port
                  service = grpc.value.service
                }
              }
              dynamic "http_get" {
                for_each = liveness_probe.value.http_get != null ? [liveness_probe.value.http_get] : []
                content {
                  host = http_get.value.host
                  dynamic "http_headers" {
                    for_each = http_get.value.http_headers != null ? http_get.value.http_headers : []
                    content {
                      name  = http_headers.value.name
                      value = http_headers.value.value
                    }
                  }
                  path   = http_get.value.path
                  port   = http_get.value.port
                  scheme = http_get.value.scheme
                }
              }
              initial_delay_seconds = liveness_probe.value.initial_delay_seconds
              period_seconds        = liveness_probe.value.period_seconds
              success_threshold     = liveness_probe.value.success_threshold
              dynamic "tcp_socket" {
                for_each = liveness_probe.value.tcp_socket != null ? [liveness_probe.value.tcp_socket] : []
                content {
                  host = tcp_socket.value.host
                  port = tcp_socket.value.port
                }
              }
              timeout_seconds = liveness_probe.value.timeout_seconds
            }
          }
          dynamic "ports" {
            for_each = container_spec.value.ports != null ? container_spec.value.ports : []
            content {
              container_port = ports.value.container_port
            }
          }
          predict_route         = container_spec.value.predict_route
          shared_memory_size_mb = container_spec.value.shared_memory_size_mb
          dynamic "startup_probe" {
            for_each = container_spec.value.startup_probe != null ? [container_spec.value.startup_probe] : []
            content {
              dynamic "exec" {
                for_each = startup_probe.value.exec != null ? [startup_probe.value.exec] : []
                content {
                  command = exec.value.command
                }
              }
              failure_threshold = startup_probe.value.failure_threshold
              dynamic "grpc" {
                for_each = startup_probe.value.grpc != null ? [startup_probe.value.grpc] : []
                content {
                  port    = grpc.value.port
                  service = grpc.value.service
                }
              }
              dynamic "http_get" {
                for_each = startup_probe.value.http_get != null ? [startup_probe.value.http_get] : []
                content {
                  host = http_get.value.host
                  dynamic "http_headers" {
                    for_each = http_get.value.http_headers != null ? http_get.value.http_headers : []
                    content {
                      name  = http_headers.value.name
                      value = http_headers.value.value
                    }
                  }
                  path   = http_get.value.path
                  port   = http_get.value.port
                  scheme = http_get.value.scheme
                }
              }
              initial_delay_seconds = startup_probe.value.initial_delay_seconds
              period_seconds        = startup_probe.value.period_seconds
              success_threshold     = startup_probe.value.success_threshold
              dynamic "tcp_socket" {
                for_each = startup_probe.value.tcp_socket != null ? [startup_probe.value.tcp_socket] : []
                content {
                  host = tcp_socket.value.host
                  port = tcp_socket.value.port
                }
              }
              timeout_seconds = startup_probe.value.timeout_seconds
            }
          }
        }
      }
      hugging_face_access_token  = model_config.value.hugging_face_access_token
      hugging_face_cache_enabled = model_config.value.hugging_face_cache_enabled
      model_display_name         = model_config.value.model_display_name
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}

