# Архітектура

<img src="https://imgpx.com/ekLSKkQjnznL.jpg" width="900" alt="Архітектура інфраструктури">


## AWS структура
- **[Amazon EKS](https://aws.amazon.com/eks/)** — керований контроль-плейн Kubernetes.
- **[AWS CloudFormation](https://aws.amazon.com/cloudformation/)** — під капотом для [eksctl](https://eksctl.io/) (інфра як код).
- **[Amazon EC2](https://aws.amazon.com/ec2/)** (Managed Node Group + Auto Scaling) — воркер-вузли (t3/t2.small/medium), авто-масштабування.
- **[Amazon VPC](https://aws.amazon.com/vpc/)** — мережа: підмережі, маршрути, Internet/NAT GW, Security Groups.
- **[AWS IAM](https://aws.amazon.com/iam/)** — ролі/політики; інтеграція з RBAC через `aws-auth`.
- **[AWS Load Balancer Controller](https://kubernetes-sigs.github.io/aws-load-balancer-controller/)** — зовнішній IP/DNS (ALB/NLB).

## Налаштування Kubernetes
- **[Deployment](https://github.com/efirshey/Mindforce_test_tusk/blob/main/Deployment.yaml)** — базовий контролер розгортання.
- **[HPA](https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale/)** — масштабує репліки за метриками (CPU тощо).
- **[Ingress Controller](https://kubernetes.io/docs/concepts/services-networking/ingress/)** — доступ іззовні.
- **[StatefulSet](https://kubernetes.io/docs/concepts/workloads/controllers/statefulset/)** — для станних сервісів/БД.
- **[DaemonSet](https://kubernetes.io/docs/concepts/workloads/controllers/daemonset/)** — агенти/збір логів на кожному вузлі.

## Налаштування Docker-контейнерів
- Мультистейдж-збірка з **найлегшими базовими образами** (alpine/distroless).

## Інфраструктура: dev, stage, prod
- Окремі акаунти **AWS** + **Terraform**, ізоляція **Namespaces**, розподіл ролей **IAM**.

## Система бекапів
- **[Velero](https://velero.io/)** — бекап/відновлення кластера та PVC із збереженням у **[S3](https://aws.amazon.com/s3/)**.

## Опис CI/CD
**CI** — лінт/формат, юніт-тести, покриття; збірка Docker-образу; push до **[Docker Hub](https://hub.docker.com/)**.  
**CD** — ручне підтвердження; **smoke**/**навантаження**; **тест міграцій**.
