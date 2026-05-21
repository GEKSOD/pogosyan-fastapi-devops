# SHARAY DevOps FastAPI Project

Учебный проект для задания по GitOps, FastAPI, Docker, Kubernetes, Terraform и Ansible.

## Что внутри

- FastAPI-приложение с health-check и метриками Prometheus.
- Проверки качества: `ruff`, `pylint`, `bandit`, `pytest`.
- Dockerfile для приложения.
- `docker-compose.yml` с приложением, Prometheus и Grafana.
- Kubernetes-манифесты: namespace, deployment, service, ingress.
- Terraform-манифесты для виртуальной машины с веб-сервером.
- Ansible playbook для доставки и запуска сервиса на созданном сервере.
- GitHub Actions workflow для CI.

## Локальный запуск

```powershell
python -m venv .venv
.\.venv\Scripts\python -m pip install -r requirements-dev.txt
.\.venv\Scripts\uvicorn app.main:app --reload
```

Проверка:

```powershell
curl http://127.0.0.1:8000/health
```

## Проверки

```powershell
ruff check .
pylint app tests
bandit -r app
pytest
```

## Публикация на GitHub

Создайте пустой репозиторий на GitHub и подключите его как `origin`:

```powershell
git remote add origin https://github.com/<github-user>/sharay-fastapi-devops.git
git push -u origin main
```

## Docker Compose

```powershell
docker compose up --build
```

Сервисы:

- FastAPI: <http://localhost:8000>
- Prometheus: <http://localhost:9090>
- Grafana: <http://localhost:3000> (`admin` / `admin`)

## Docker Hub

Замените `your-dockerhub-username` на свой логин в Docker Hub:

```powershell
docker build -t your-dockerhub-username/sharay-fastapi:latest .
docker push your-dockerhub-username/sharay-fastapi:latest
```

Такой же образ указан в `k8s/deployment.yaml`, `terraform/cloud-init.yaml.tftpl` и `ansible/group_vars/all.yml`.

## Kubernetes

```powershell
kubectl apply -f k8s/
```

Перед применением обновите образ в `k8s/deployment.yaml` на ваш Docker Hub repository.

## Terraform

Пример рассчитан на Yandex Cloud. Создайте `terraform/terraform.tfvars`:

```hcl
cloud_id  = "..."
folder_id = "..."
subnet_id = "..."
ssh_public_key_path = "~/.ssh/id_rsa.pub"
```

Запуск:

```powershell
cd terraform
terraform init
terraform apply
```

Terraform создаст VM и выведет публичный IP.

## Ansible

После Terraform заполните `ansible/inventory.ini`:

```ini
[web]
<PUBLIC_IP> ansible_user=ubuntu
```

Запуск:

```powershell
ansible-playbook -i ansible/inventory.ini ansible/deploy.yml
```
