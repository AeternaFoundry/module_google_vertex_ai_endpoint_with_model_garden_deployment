variable "vertex_ai_endpoint_with_model_garden_deployments" {
  description = <<EOT
Map of vertex_ai_endpoint_with_model_garden_deployments, attributes below
Required:
    - location
Optional:
    - deletion_policy
    - hugging_face_model_id
    - project
    - publisher_model_name
    - deploy_config (block):
        - dedicated_resources (optional, block):
            - autoscaling_metric_specs (optional, block):
                - metric_name (required)
                - target (optional)
            - machine_spec (required, block):
                - accelerator_count (optional)
                - accelerator_type (optional)
                - machine_type (optional)
                - multihost_gpu_node_count (optional)
                - reservation_affinity (optional, block):
                    - key (optional)
                    - reservation_affinity_type (required)
                    - values (optional)
                - tpu_topology (optional)
            - max_replica_count (optional)
            - min_replica_count (required)
            - required_replica_count (optional)
            - spot (optional)
        - fast_tryout_enabled (optional)
        - system_labels (optional)
    - endpoint_config (block):
        - dedicated_endpoint_enabled (optional)
        - endpoint_display_name (optional)
        - private_service_connect_config (optional, block):
            - enable_private_service_connect (required)
            - project_allowlist (optional)
            - psc_automation_configs (optional, block):
                - network (required)
                - project_id (required)
    - model_config (block):
        - accept_eula (optional)
        - container_spec (optional, block):
            - args (optional)
            - command (optional)
            - deployment_timeout (optional)
            - env (optional, block):
                - name (required)
                - value (required)
            - grpc_ports (optional, block):
                - container_port (optional)
            - health_probe (optional, block):
                - exec (optional, block):
                    - command (optional)
                - failure_threshold (optional)
                - grpc (optional, block):
                    - port (optional)
                    - service (optional)
                - http_get (optional, block):
                    - host (optional)
                    - http_headers (optional, block):
                        - name (optional)
                        - value (optional)
                    - path (optional)
                    - port (optional)
                    - scheme (optional)
                - initial_delay_seconds (optional)
                - period_seconds (optional)
                - success_threshold (optional)
                - tcp_socket (optional, block):
                    - host (optional)
                    - port (optional)
                - timeout_seconds (optional)
            - health_route (optional)
            - image_uri (required)
            - liveness_probe (optional, block):
                - exec (optional, block):
                    - command (optional)
                - failure_threshold (optional)
                - grpc (optional, block):
                    - port (optional)
                    - service (optional)
                - http_get (optional, block):
                    - host (optional)
                    - http_headers (optional, block):
                        - name (optional)
                        - value (optional)
                    - path (optional)
                    - port (optional)
                    - scheme (optional)
                - initial_delay_seconds (optional)
                - period_seconds (optional)
                - success_threshold (optional)
                - tcp_socket (optional, block):
                    - host (optional)
                    - port (optional)
                - timeout_seconds (optional)
            - ports (optional, block):
                - container_port (optional)
            - predict_route (optional)
            - shared_memory_size_mb (optional)
            - startup_probe (optional, block):
                - exec (optional, block):
                    - command (optional)
                - failure_threshold (optional)
                - grpc (optional, block):
                    - port (optional)
                    - service (optional)
                - http_get (optional, block):
                    - host (optional)
                    - http_headers (optional, block):
                        - name (optional)
                        - value (optional)
                    - path (optional)
                    - port (optional)
                    - scheme (optional)
                - initial_delay_seconds (optional)
                - period_seconds (optional)
                - success_threshold (optional)
                - tcp_socket (optional, block):
                    - host (optional)
                    - port (optional)
                - timeout_seconds (optional)
        - hugging_face_access_token (optional)
        - hugging_face_cache_enabled (optional)
        - model_display_name (optional)
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
EOT

  type = map(object({
    location              = string
    deletion_policy       = optional(string)
    hugging_face_model_id = optional(string)
    project               = optional(string)
    publisher_model_name  = optional(string)
    deploy_config = optional(object({
      dedicated_resources = optional(object({
        autoscaling_metric_specs = optional(list(object({
          metric_name = string
          target      = optional(number)
        })))
        machine_spec = object({
          accelerator_count        = optional(number)
          accelerator_type         = optional(string)
          machine_type             = optional(string)
          multihost_gpu_node_count = optional(number)
          reservation_affinity = optional(object({
            key                       = optional(string)
            reservation_affinity_type = string
            values                    = optional(list(string))
          }))
          tpu_topology = optional(string)
        })
        max_replica_count      = optional(number)
        min_replica_count      = number
        required_replica_count = optional(number)
        spot                   = optional(bool)
      }))
      fast_tryout_enabled = optional(bool)
      system_labels       = optional(map(string))
    }))
    endpoint_config = optional(object({
      dedicated_endpoint_enabled = optional(bool)
      endpoint_display_name      = optional(string)
      private_service_connect_config = optional(object({
        enable_private_service_connect = bool
        project_allowlist              = optional(list(string))
        psc_automation_configs = optional(object({
          network    = string
          project_id = string
        }))
      }))
    }))
    model_config = optional(object({
      accept_eula = optional(bool)
      container_spec = optional(object({
        args               = optional(list(string))
        command            = optional(list(string))
        deployment_timeout = optional(string)
        env = optional(list(object({
          name  = string
          value = string
        })))
        grpc_ports = optional(list(object({
          container_port = optional(number)
        })))
        health_probe = optional(object({
          exec = optional(object({
            command = optional(list(string))
          }))
          failure_threshold = optional(number)
          grpc = optional(object({
            port    = optional(number)
            service = optional(string)
          }))
          http_get = optional(object({
            host = optional(string)
            http_headers = optional(list(object({
              name  = optional(string)
              value = optional(string)
            })))
            path   = optional(string)
            port   = optional(number)
            scheme = optional(string)
          }))
          initial_delay_seconds = optional(number)
          period_seconds        = optional(number)
          success_threshold     = optional(number)
          tcp_socket = optional(object({
            host = optional(string)
            port = optional(number)
          }))
          timeout_seconds = optional(number)
        }))
        health_route = optional(string)
        image_uri    = string
        liveness_probe = optional(object({
          exec = optional(object({
            command = optional(list(string))
          }))
          failure_threshold = optional(number)
          grpc = optional(object({
            port    = optional(number)
            service = optional(string)
          }))
          http_get = optional(object({
            host = optional(string)
            http_headers = optional(list(object({
              name  = optional(string)
              value = optional(string)
            })))
            path   = optional(string)
            port   = optional(number)
            scheme = optional(string)
          }))
          initial_delay_seconds = optional(number)
          period_seconds        = optional(number)
          success_threshold     = optional(number)
          tcp_socket = optional(object({
            host = optional(string)
            port = optional(number)
          }))
          timeout_seconds = optional(number)
        }))
        ports = optional(list(object({
          container_port = optional(number)
        })))
        predict_route         = optional(string)
        shared_memory_size_mb = optional(string)
        startup_probe = optional(object({
          exec = optional(object({
            command = optional(list(string))
          }))
          failure_threshold = optional(number)
          grpc = optional(object({
            port    = optional(number)
            service = optional(string)
          }))
          http_get = optional(object({
            host = optional(string)
            http_headers = optional(list(object({
              name  = optional(string)
              value = optional(string)
            })))
            path   = optional(string)
            port   = optional(number)
            scheme = optional(string)
          }))
          initial_delay_seconds = optional(number)
          period_seconds        = optional(number)
          success_threshold     = optional(number)
          tcp_socket = optional(object({
            host = optional(string)
            port = optional(number)
          }))
          timeout_seconds = optional(number)
        }))
      }))
      hugging_face_access_token  = optional(string)
      hugging_face_cache_enabled = optional(bool)
      model_display_name         = optional(string)
    }))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
  }))
}

