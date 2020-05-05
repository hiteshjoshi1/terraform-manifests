## Terraform learning

1. Install Terraform

```
brew install terraform
```

2. For AWS Install Awscli - https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-install.html

And run `aws configure`

3. Init terraform in the directory-

```
terraform init
```

4. Plan if you need to see what is being created (Not saving the plan)

```
terraform plan
```

5. Actually create the cluster -

```
terraform apply
```

\*\*Note - This will cost \$\$. You are creating 3 nodes (t2.micro ec2 instances), VPC, auto scaling
groups.

The aws-k8-eks/learn-terraform-provision-eks-cluster/ example is taken from Hashicorp documentation
https://learn.hashicorp.com/terraform/kubernetes/provision-eks-cluster

I have modified the region, instance sizes and fixed the wget issue by reverting it back to curl.

This hashicorp module uses the following registry internally -
https://registry.terraform.io/modules/terraform-aws-modules/vpc/aws/2.32.0

https://registry.terraform.io/modules/terraform-aws-modules/eks/aws/11.0.0

6. If you are setting up the eks cluster in aws-k8-eks , then after successful terraform apply, update
   Kubeconfig so that you can connect to your cluster using kubectl -
   aws eks --region <your_region_nnme> update-kubeconfig --name <your-cluster-name>

```
aws eks --region ap-southeast-1 update-kubeconfig --name training-eks-FtqucHDy
```

Alternatively, 
```
mkdir ~/.kube/
terraform output kubeconfig>~/.kube/config
```

7. Bring the cluster down

```
terraform destroy
```
