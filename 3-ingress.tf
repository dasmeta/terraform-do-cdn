locals {
  ssl_cert_secret_name = replace(var.domain, ".", "-")
  namespace            = var.environment == "" ? "default" : var.environment
}

resource "kubernetes_manifest" "service" {
  manifest = yamldecode(<<EOT
apiVersion: v1
kind: Service
metadata:
  name: proxy-to-space
  namespace: ${local.namespace}
spec:
  type: ExternalName
  externalName: ${var.name}.${var.region}.cdn.digitaloceanspaces.com
  ports:
    - name: http
      protocol: TCP
      port: 80
      targetPort: 80
EOT
  )
}

resource "kubernetes_manifest" "ingress" {
  manifest = yamldecode(<<EOT
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  annotations:
    cert-manager.io/cluster-issuer: prod-issuer
    nginx.ingress.kubernetes.io/force-ssl-redirect: "true"
    nginx.ingress.kubernetes.io/server-snippet: |
      proxy_intercept_errors on;
      error_page 404 403 =200 /index.html;
      add_header Cache-Control "no-store, no-cache, must-revalidate, proxy-revalidate, max-age=0";
      proxy_cache off;
      expires off;
    nginx.ingress.kubernetes.io/upstream-vhost: ${var.name}.${var.region}.cdn.digitaloceanspaces.com
    # nginx.ingress.kubernetes.io/from-to-www-redirect: "true"
    # nginx.ingress.kubernetes.io/use-regex: "true"
    kubernetes.io/ingress.class: nginx
  name: ingress-to-space
  namespace: ${local.namespace}
spec:
  rules:
  - host: ${var.domain}
    http:
      paths:
      - backend:
          service:
            name: proxy-service
            port:
              number: 80
        path: /
        pathType: Prefix
  tls:
  - hosts:
    - ${var.domain}
    secretName: ${local.ssl_cert_secret_name}
EOT
  )
}
