## Description

Esse repositório contém um modulo Terraform para criar uma instância RDS PostgreSQL na AWS e um secret manager para armazenar a senha do banco de dados. O módulo foi criado para ser utilizado em conjunto com a infraestrutura EKS criada no repositório [fiap-tech-challenge-eks](https://github.com/rafabernardo/fiap-tech-challenge-k8s-infra).

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) >= 1.10.0
- Conta AWS com permissões apropriadas
- Secrets configurados no repositório do GitHub para credenciais da AWS e outros dados sensíveis

## GitHub Actions

Este repositório utiliza GitHub Actions para automatizar a execução do Terraform. O arquivo de configuração do GitHub Actions está localizado em [.github/workflows/pipeline.yml](.github/workflows/pipeline.yml). Este arquivo contém o fluxo de trabalho que será executado toda vez que um push for feito no repositório na branch `main` e também quando um pull request for aberto. A action irá validar a sintaxe do Terraform, a execucao do `terraform plan` é feita pelo repositorio [fiap-tech-challenge-eks](https://github.com/rafabernardo/fiap-tech-challenge-k8s-infra).

### GitHub Secrets

- `AWS_ACCESS_KEY_ID`: AWS access key ID
- `AWS_SECRET_ACCESS_KEY`: AWS secret access key
- `AWS_REGION`: AWS region
- `AWS_SESSION_TOKEN`: AWS session token (mandatory for AWS Academy accounts)
- `DB_NAME`: Nome do banco de dados
