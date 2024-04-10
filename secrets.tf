# Secret for DB_NAME
resource "google_secret_manager_secret" "secret-db-name" {
  secret_id = "DB_NAME"
  labels = {
    label = "my-label"
  }
  replication {
    auto {}
  }
}


resource "google_secret_manager_secret_version" "secret-version-basic" {
  secret      = google_secret_manager_secret.secret-db-name.id
  secret_data = google_sql_database.webapp_database.name
}

# Secret for DB_USER
resource "google_secret_manager_secret" "secret-db-user" {
  secret_id = "DB_USER"
  labels = {
    label = "my-label"
  }
  replication {
    auto {}
  }
}

resource "google_secret_manager_secret_version" "secret-version-db-user" {
  secret      = google_secret_manager_secret.secret-db-user.id
  secret_data = google_sql_user.webapp_user.name
}

# Secret for DB_PASSWORD
resource "google_secret_manager_secret" "secret-db-password" {
  secret_id = "DB_PASSWORD"
  labels = {
    label = "my-label"
  }
  replication {
    auto {}
  }
}

resource "google_secret_manager_secret_version" "secret-version-db-password" {
  secret      = google_secret_manager_secret.secret-db-password.id
  secret_data = google_sql_user.webapp_user.password
}

# Secret for DB_PORT
resource "google_secret_manager_secret" "secret-db-port" {
  secret_id = "DB_PORT"
  labels = {
    label = "my-label"
  }
  replication {
    auto {}
  }
}

resource "google_secret_manager_secret_version" "secret-version-db-port" {
  secret      = google_secret_manager_secret.secret-db-port.id
  secret_data = var.database_port
}

# Secret for DB_HOST
resource "google_secret_manager_secret" "secret-db-host" {
  secret_id = "DB_HOST"
  labels = {
    label = "my-label"
  }
  replication {
    auto {}
  }
}

resource "google_secret_manager_secret_version" "secret-version-db-host" {
  secret      = google_secret_manager_secret.secret-db-host.id
  secret_data = google_sql_database_instance.webapp_database_instance.private_ip_address
}

# Secret for PUBSUB_TOPIC_NAME
resource "google_secret_manager_secret" "secret-pubsub-topic" {
  secret_id = "PUBSUB_TOPIC_NAME"
  labels = {
    label = "my-label"
  }
  replication {
    auto {}
  }
}

resource "google_secret_manager_secret_version" "secret-version-pubsub-topic" {
  secret      = google_secret_manager_secret.secret-pubsub-topic.id
  secret_data = var.pubsub_topic_name
}

# Secret for TOKEN_EXPIRY
resource "google_secret_manager_secret" "secret-token-expiry" {
  secret_id = "TOKEN_EXPIRY"
  labels = {
    label = "my-label"
  }
  replication {
    auto {}
  }
}

resource "google_secret_manager_secret_version" "secret-version-token-expiry" {
  secret      = google_secret_manager_secret.secret-token-expiry.id
  secret_data = var.token_expiry
}

resource "google_secret_manager_secret" "region" {
  secret_id = "REGION"
  replication {
    auto {}
  }
}

resource "google_secret_manager_secret_version" "region-version" {
  secret      = google_secret_manager_secret.region.id
  secret_data = var.region
}

resource "google_secret_manager_secret" "machine-type" {
  secret_id = "MACHINE_TYPE"
  replication {
    auto {}
  }
}

resource "google_secret_manager_secret_version" "machine-type-version" {
  secret      = google_secret_manager_secret.machine-type.id
  secret_data = var.machine_type
}

resource "google_secret_manager_secret" "boot-disk-size" {
  secret_id = "BOOT_DISK_SIZE"
  replication {
    auto {}
  }
}

resource "google_secret_manager_secret_version" "boot-disk-size-version" {
  secret      = google_secret_manager_secret.boot-disk-size.id
  secret_data = var.boot_disk_size
}

resource "google_secret_manager_secret" "boot-disk-type" {
  secret_id = "BOOT_DISK_TYPE"
  replication {
    auto {}
  }
}

resource "google_secret_manager_secret_version" "boot-disk-type-version" {
  secret      = google_secret_manager_secret.boot-disk-type.id
  secret_data = var.boot_disk_type
}

resource "google_secret_manager_secret" "project" {
  secret_id = "PROJECT"
  replication {
    auto {}
  }
}

resource "google_secret_manager_secret_version" "project-version" {
  secret      = google_secret_manager_secret.project.id
  secret_data = var.project_id
}

resource "google_secret_manager_secret" "network" {
  secret_id = "NETWORK"
  replication {
    auto {}
  }
}

resource "google_secret_manager_secret_version" "network-version" {
  secret      = google_secret_manager_secret.network.id
  secret_data = var.vpc_name
}

resource "google_secret_manager_secret" "webapp-subnet" {
  secret_id = "WEBAPP_SUBNET"
  replication {
    auto {}
  }
}

resource "google_secret_manager_secret_version" "webapp-subnet-version" {
  secret      = google_secret_manager_secret.webapp-subnet.id
  secret_data = var.webapp-subnet
}

resource "google_secret_manager_secret" "network-tier" {
  secret_id = "NETWORK_TIER"
  replication {
    auto {}
  }
}

resource "google_secret_manager_secret_version" "network-tier-version" {
  secret      = google_secret_manager_secret.network-tier.id
  secret_data = var.network_tier
}

resource "google_secret_manager_secret" "vm-service-account-email" {
  secret_id = "VM_SERVICE_ACCOUNT_EMAIL"
  replication {
    auto {}
  }
}

resource "google_secret_manager_secret_version" "vm-service-account-email-version" {
  secret      = google_secret_manager_secret.vm-service-account-email.id
  secret_data = google_service_account.gcp_sa_cloud_vm.email
}

resource "google_secret_manager_secret" "vm-service-account-scopes" {
  secret_id = "VM_SERVICE_ACCOUNT_SCOPES"
  replication {
    auto {}
  }
}

resource "google_secret_manager_secret_version" "vm-service-account-scopes-version" {
  secret      = google_secret_manager_secret.vm-service-account-scopes.id
  secret_data = "https://www.googleapis.com/auth/cloud-platform"
}

resource "google_secret_manager_secret" "vm-instnace-tags" {
  secret_id = "VM_INSTANCE_TAGS"
  replication {
    auto {}
  }
}

resource "google_secret_manager_secret_version" "vm-instnace-tags-version" {
  secret      = google_secret_manager_secret.vm-instnace-tags.id
  secret_data = "webapp,allow-health-check"
}

resource "google_secret_manager_secret" "instance-group-manager" {
  secret_id = "INSTANCE_GROUP_MANAGER"
  replication {
    auto {}
  }
}

resource "google_secret_manager_secret_version" "instance-group-manager-version" {
  secret      = google_secret_manager_secret.instance-group-manager.id
  secret_data = var.instance_group_manager_name
}

resource "google_secret_manager_secret" "instance-kms-key" {
  secret_id = "INSTANCE_KMS_KEY"
  replication {
    auto {}
  }
}

resource "google_secret_manager_secret_version" "instance-kms-key-version" {
  secret      = google_secret_manager_secret.instance-kms-key.id
  secret_data = google_kms_crypto_key.webapp_vm_key.id
}


