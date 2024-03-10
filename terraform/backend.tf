terraform {
  cloud {
    organization = "thebigstevo"

    workspaces {
      name = "3-tier-gke-argo-prometheus"
    }
  }


}