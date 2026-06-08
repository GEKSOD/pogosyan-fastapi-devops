# Чек-лист сверки с заданием

## 1. Репозиторий GitHub

- [x] Репозиторий создан и опубликован на GitHub.
- [x] GitHub URL: `https://github.com/GEKSOD/pogosyan-fastapi-devops`.
- [x] CI настроен в `.github/workflows/ci.yml`.
- [x] SAST: `bandit`.
- [x] Линтеры и форматеры: `ruff`, `pylint`.
- [x] Тесты: `pytest`.

## 2. Сервис Flask/FastAPI

- [x] Реализован FastAPI-сервис.
- [x] Основной файл: `app/main.py`.
- [x] Endpoints: `/`, `/health`, `/metrics`.
- [x] Тесты: `tests/test_main.py`.

## 3. Docker

- [x] Добавлен `Dockerfile`.
- [x] Приложение собирается в Docker-образ.
- [x] Локальный тег для проверки: `pogosyan-fastapi:local`.

## 4. Docker Hub

- [x] Образ опубликован на Docker Hub.
- [x] Docker image: `geksod/pogosyan-fastapi:latest`.
- [x] Docker Hub URL: `https://hub.docker.com/r/geksod/pogosyan-fastapi`.

## 5. Yandex Cloud через Terraform

- [x] Terraform-манифесты подготовлены.
- [x] Terraform создаёт VM, сеть, подсеть и security group.
- [x] Через `cloud-init` устанавливаются Docker и Nginx.
- [x] На VM запускается образ `geksod/pogosyan-fastapi:latest`.
- [ ] `terraform apply` нужно выполнить в Yandex Cloud для фактического создания VM.

## 6. Minikube / Kubernetes

- [x] Namespace: `k8s/namespace.yaml`.
- [x] Deployment: `k8s/deployment.yaml`.
- [x] Service: `k8s/service.yaml`.
- [x] Ingress: `k8s/ingress.yaml`.
- [x] Pod тянет образ из Docker Hub: `docker.io/geksod/pogosyan-fastapi:latest`.
- [ ] `kubectl apply -f k8s/` нужно выполнить в minikube для фактической развёртки.

## 7. README.md

- [x] README описывает локальный запуск.
- [x] README описывает проверки качества.
- [x] README описывает Docker и Docker Hub.
- [x] README описывает Docker Compose, Prometheus и Grafana.
- [x] README описывает minikube/Kubernetes.
- [x] README описывает Terraform для Yandex Cloud.
- [x] README описывает Ansible.
