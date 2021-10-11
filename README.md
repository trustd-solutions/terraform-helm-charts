<img src="https://trustd.solutions/images/logo.png"/>

# terraform-aws-helm
Terrraform module to release helm charts

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 3.62.0 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | 2.3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 3.62.0 |
| <a name="provider_helm"></a> [helm](#provider\_helm) | 2.3.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [helm_release.this](https://registry.terraform.io/providers/hashicorp/helm/2.3.0/docs/resources/release) | resource |
| [aws_eks_cluster.this](https://registry.terraform.io/providers/hashicorp/aws/3.62.0/docs/data-sources/eks_cluster) | data source |
| [aws_eks_cluster_auth.this](https://registry.terraform.io/providers/hashicorp/aws/3.62.0/docs/data-sources/eks_cluster_auth) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_charts"></a> [charts](#input\_charts) | List of helm charts to release | <pre>map(<br>    object(<br>      {<br>        release_name              = string<br>        repository_url            = string<br>        name                      = string<br>        version                   = string<br>        namespace                 = string<br>        timeout                   = number<br>        atomic                    = bool<br>        max_history               = number<br>        override_values_file_path = string<br>        cleanup_on_fail           = bool<br>        recreate_pods             = bool<br>        force_update              = bool<br>        set = list(<br>          object(<br>            {<br>              name  = string<br>              value = any<br>            }<br>          )<br>        )<br>      }<br>    )<br>  )</pre> | n/a | yes |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | Name of the target cluster to install helm charts | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_release_status"></a> [release\_status](#output\_release\_status) | Block status of the deployed release |
