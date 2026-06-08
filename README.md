# Pogosyan DevOps FastAPI Project

Учебный DevOps-проект: FastAPI-сервис, CI-проверки, Docker-образ, Docker Compose с мониторингом, Kubernetes-манифесты, Terraform для Yandex Cloud и Ansible для деплоя на VM.

## Ссылки

- GitHub: <https://github.com/GEKSOD/pogosyan-fastapi-devops>
- Docker Hub: <https://hub.docker.com/r/geksod/pogosyan-fastapi>
- Docker image: `geksod/pogosyan-fastapi:latest`

## Состав проекта

- `app/` - FastAPI-приложение.
- `tests/` - pytest-тесты.
- `.github/workflows/ci.yml` - GitHub Actions pipeline.
- `Dockerfile` - сборка контейнера приложения.
- `docker-compose.yml` - приложение, Prometheus и Grafana.
- `monitoring/` - конфигурация Prometheus и Grafana datasource.
- `k8s/` - namespace, deployment, service, ingress для minikube/k8s.
- `terraform/` - создание VM, сети, подсети и security group в Yandex Cloud.
- `ansible/` - доставка compose/nginx-конфигурации на сервер.

## Требования

- Python 3.11+
- Docker Desktop или Docker Engine
- Git
- `kubectl` и `minikube` для проверки Kubernetes-части
- Terraform 1.6+
- Yandex Cloud CLI или переменная окружения `YC_TOKEN`
- Ansible и коллекция `community.docker`

## 1. GitHub, SAST, линтеры и тесты

В проекте настроены:

- SAST: `bandit`
- Линтеры и форматеры: `ruff`, `pylint`
- Тесты: `pytest`
- CI: GitHub Actions

Локальный запуск проверок:

```powershell
python -m venv .venv
.\.venv\Scripts\python -m pip install -r requirements-dev.txt
.\.venv\Scripts\ruff check .
.\.venv\Scripts\pylint app tests
.\.venv\Scripts\bandit -r app
.\.venv\Scripts\pytest
```

## 2. FastAPI-сервис

Локальный запуск:

```powershell
.\.venv\Scripts\uvicorn app.main:app --reload
```

Проверка:

```powershell
curl http://127.0.0.1:8000/
curl http://127.0.0.1:8000/health
curl http://127.0.0.1:8000/metrics
```

Основные endpoints:

- `/` - информация о сервисе
- `/health` - health-check
- `/metrics` - Prometheus metrics

## 3. Docker

Сборка локального образа:

```powershell
docker build -t pogosyan-fastapi:local .
```

Запуск контейнера:

```powershell
docker run --rm -p 8000:8000 pogosyan-fastapi:local
```

Проверка:

```powershell
curl http://127.0.0.1:8000/health
```

## 4. Docker Hub

Публикуемый образ:

```text
geksod/pogosyan-fastapi:latest
```

Команды сборки и публикации:

```powershell
docker build -t geksod/pogosyan-fastapi:latest .
docker push geksod/pogosyan-fastapi:latest
```

Проверка загрузки:

```powershell
docker pull geksod/pogosyan-fastapi:latest
```

## 5. Docker Compose, Prometheus и Grafana

Запуск:

```powershell
docker compose up --build
```

Сервисы:

- FastAPI: <http://localhost:8000>
- Prometheus: <http://localhost:9090>
- Grafana: <http://localhost:3000>

Данные Grafana по умолчанию:

```text
admin / admin
```

Prometheus забирает метрики приложения с `/metrics`.

## 6. Minikube / Kubernetes

Манифесты находятся в `k8s/`:

- `namespace.yaml`
- `deployment.yaml`
- `service.yaml`
- `ingress.yaml`

В deployment используется образ из Docker Hub:

```text
docker.io/geksod/pogosyan-fastapi:latest
```

Пример запуска в minikube:

```powershell
minikube start
minikube addons enable ingress
kubectl apply -f k8s/
kubectl get all -n pogosyan
kubectl get ingress -n pogosyan
```

Для локальной проверки ingress добавьте адрес minikube в hosts-файл:

```powershell
minikube ip
```

Пример записи:

```text
<MINIKUBE_IP> pogosyan-fastapi.local
```

Проверка:

```powershell
curl http://pogosyan-fastapi.local/health
```

Если ingress не нужен, можно проверить сервис через port-forward:

```powershell
kubectl port-forward -n pogosyan service/pogosyan-fastapi 8000:80
curl http://127.0.0.1:8000/health
```

## 7. Yandex Cloud через Terraform

Terraform создаёт:

- VPC network
- subnet
- security group для портов `22`, `80`, `8000`
- VM `pogosyan-fastapi-web`
- Nginx reverse proxy
- Docker-контейнер с образом `geksod/pogosyan-fastapi:latest`

Подготовьте `terraform/terraform.tfvars`:

```hcl
cloud_id            = "<YANDEX_CLOUD_ID>"
folder_id           = "<YANDEX_FOLDER_ID>"
zone                = "ru-central1-a"
ssh_public_key_path = "~/.ssh/id_rsa.pub"
docker_image        = "geksod/pogosyan-fastapi:latest"
```

Запуск:

```powershell
cd terraform
terraform init
terraform plan
terraform apply
```

После выполнения Terraform выведет:

- `web_public_ip`
- `service_url`

Проверка:

```powershell
curl http://<WEB_PUBLIC_IP>/health
```

Удаление ресурсов после проверки:

```powershell
terraform destroy
```

## 8. Ansible

После создания VM через Terraform заполните inventory:

```ini
[web]
<WEB_PUBLIC_IP> ansible_user=ubuntu ansible_ssh_private_key_file=../.ssh/pogosyan_vm
```

Файл можно сохранить как `ansible/inventory.ini`.

Запуск playbook:

```powershell
ansible-galaxy collection install -r ansible/requirements.yml
ansible-playbook -i ansible/inventory.ini ansible/deploy.yml
```

Playbook:

- устанавливает Docker и Nginx;
- копирует Docker Compose файл на сервер;
- настраивает Nginx reverse proxy;
- запускает контейнер с FastAPI-сервисом.

## Быстрая сверка задания

- Репозиторий GitHub: выполнено.
- FastAPI-сервис: выполнено.
- Dockerfile и Docker Compose: выполнено.
- Образ в Docker Hub: выполнено.
- Kubernetes-манифесты для minikube: подготовлены.
- Terraform для Yandex Cloud VM: подготовлен.
- Ansible для деплоя на VM: подготовлен.
- README.md: выполнено.
