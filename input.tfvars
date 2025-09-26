
  name               = "my-cluster"
  kubernetes_version = "1.33"
  region = "ap-south-1"

  addons = {
    coredns                = {}
    eks-pod-identity-agent = {
      before_compute = true
    }
    kube-proxy             = {}
    vpc-cni                = {
      before_compute = true
    }
  }


  vpc_id                   = "vpc-02b0ec42bd7ece914"
  subnet_ids               = ["subnet-038949c55aaa713f6", "subnet-04043d2a21d7f8d2f"]
  control_plane_subnet_ids = ["subnet-038949c55aaa713f6", "subnet-04043d2a21d7f8d2f"]

  # EKS Managed Node Group(s)
  eks_managed_node_groups = {
    Node_1 = {
      # Starting on 1.30, AL2023 is the default AMI type for EKS managed node groups
      ami_type       = "AL2023_x86_64_STANDARD"
      instance_types = ["t3.xlarge"]

      min_size     = 2
      max_size     = 10
      desired_size = 2
    }
  }

  tags = {
    Environment = "dev"
    Terraform   = "true"
  }

