#create namespace first
resource "kubernetes_namespace" "istio_system" {
  metadata {
    name = "istio-system"
  }
}

#install istio-base with helm 
resource "helm_release" "istio_base" {
  name  = "istio-base"
  chart = "istio-1.9.2/manifests/charts/base"

  timeout = 120
  cleanup_on_fail = true
  force_update    = true
  namespace       = "istio-system"


  depends_on = [digitalocean_kubernetes_cluster.demo_cluster, kubernetes_namespace.istio_system]
}

#install istiod with helm
resource "helm_release" "istiod" {
  name  = "istiod"
  chart = "istio-1.9.2/manifests/charts/istio-control/istio-discovery"

  timeout = 120
  cleanup_on_fail = true
  force_update    = true
  namespace       = "istio-system"

  depends_on = [digitalocean_kubernetes_cluster.demo_cluster, kubernetes_namespace.istio_system, helm_release.istio_base]
}

#install istio-ingress with helm, for Gateway ingress connection
resource "helm_release" "istio_ingress" {
  name  = "istio-ingress"
  chart = "istio-1.9.2/manifests/charts/gateways/istio-ingress"

  timeout = 120
  cleanup_on_fail = true
  force_update    = true
  namespace       = "istio-system"

  depends_on = [digitalocean_kubernetes_cluster.demo_cluster, kubernetes_namespace.istio_system, helm_release.istiod]
}

#install istio-egress with helm, for Controll egress connection
resource "helm_release" "istio_egress" {
  name  = "istio-egress"
  chart = "istio-1.9.2/manifests/charts/gateways/istio-egress"

  timeout = 120
  cleanup_on_fail = true
  force_update    = true
  namespace       = "istio-system"

  depends_on = [digitalocean_kubernetes_cluster.demo_cluster, kubernetes_namespace.istio_system, helm_release.istiod]
}