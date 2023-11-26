resource "vault_auth_backend" "kubernetes" {
  type = "kubernetes"
}

resource "vault_mount" "kvv2" {
  path        = "secrets"
  type        = "kv-v2"
  description = "KV Version 2 secret engine mount"
}

# resource "vault_kubernetes_auth_backend_config" "example" {
#   backend                = vault_auth_backend.kubernetes.path
#   kubernetes_host        = "http://example.com:443"
#   kubernetes_ca_cert     = "-----BEGIN CERTIFICATE-----\nexample\n-----END CERTIFICATE-----"
#   token_reviewer_jwt     = "ZXhhbXBsZQo="
#   issuer                 = "api"
#   disable_iss_validation = "true"
# }

# resource "vault_kubernetes_secret_backend" "config" {
#   path                      = "kubernetes"
#   description               = "kubernetes secrets engine description"
#   default_lease_ttl_seconds = 43200
#   max_lease_ttl_seconds     = 86400
#   kubernetes_host           = "https://127.0.0.1:61233"
#   kubernetes_ca_cert        = file("/path/to/cert")
#   service_account_jwt       = file("/path/to/token")
#   disable_local_ca_jwt      = false
# }
