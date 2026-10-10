resource "aws_docdb_cluster_instance" "docdb_cluster_instances" {
  for_each = var.docdb_cluster_instances

  cluster_identifier              = each.value.cluster_identifier
  instance_class                  = each.value.instance_class
  region                          = each.value.region
  promotion_tier                  = each.value.promotion_tier
  preferred_maintenance_window    = each.value.preferred_maintenance_window
  performance_insights_kms_key_id = each.value.performance_insights_kms_key_id
  identifier_prefix               = each.value.identifier_prefix
  identifier                      = each.value.identifier
  engine                          = each.value.engine
  enable_performance_insights     = each.value.enable_performance_insights
  copy_tags_to_snapshot           = each.value.copy_tags_to_snapshot
  certificate_rotation_restart    = each.value.certificate_rotation_restart
  ca_cert_identifier              = each.value.ca_cert_identifier
  availability_zone               = each.value.availability_zone
  auto_minor_version_upgrade      = each.value.auto_minor_version_upgrade
  apply_immediately               = each.value.apply_immediately
  tags                            = each.value.tags
  tags_all                        = each.value.tags_all
}

