# resource "vault_kubernetes_secret_backend_role" "sa-example" {
#   backend                       = vault_kubernetes_secret_backend.config.path
#   name                          = "helloworld-role"
#   allowed_kubernetes_namespaces = ["helloworld"]
#   token_max_ttl                 = 43200
#   token_default_ttl             = 21600
#   service_account_name          = "helloworld-service-account"

#   extra_labels = {
#   }

#   extra_annotations = {
#   }
# }
