variable "docdb_cluster_instances" {
  description = <<EOT
Map of docdb_cluster_instances, attributes below
Required:
    - cluster_identifier
    - instance_class
Optional:
    - apply_immediately
    - auto_minor_version_upgrade
    - availability_zone
    - ca_cert_identifier
    - certificate_rotation_restart
    - copy_tags_to_snapshot
    - enable_performance_insights
    - engine
    - identifier
    - identifier_prefix
    - performance_insights_kms_key_id
    - preferred_maintenance_window
    - promotion_tier
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    cluster_identifier              = string
    instance_class                  = string
    region                          = optional(string)
    promotion_tier                  = optional(number)
    preferred_maintenance_window    = optional(string)
    performance_insights_kms_key_id = optional(string)
    identifier_prefix               = optional(string)
    identifier                      = optional(string)
    engine                          = optional(string)
    enable_performance_insights     = optional(bool)
    copy_tags_to_snapshot           = optional(bool)
    certificate_rotation_restart    = optional(string)
    ca_cert_identifier              = optional(string)
    availability_zone               = optional(string)
    auto_minor_version_upgrade      = optional(bool)
    apply_immediately               = optional(bool)
    tags                            = optional(map(string))
    tags_all                        = optional(map(string))
  }))
  validation {
    condition = alltrue([
      for k, v in var.docdb_cluster_instances : (
        v.promotion_tier == null || (v.promotion_tier >= 0 && v.promotion_tier <= 15)
      )
    ])
    error_message = "must be between 0 and 15"
  }
  # Note: 11 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

