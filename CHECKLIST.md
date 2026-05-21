# Чек-лист сверки с заданием

## 1. GitOps

- [x] Создан локальный git-репозиторий.
- [x] Создан коммит с проектом: `f04c2aa Initial DevOps FastAPI project`.
- [x] Добавлен SAST: `bandit`.
- [x] Добавлены линтеры и форматеры: `pylint`, `ruff`.
- [x] Добавлено тестирование: `pytest`.
- [x] Добавлен GitHub Actions workflow: `.github/workflows/ci.yml`.
- [ ] Репозиторий запушен на GitHub.

Статус: локально выполнено. Для push на GitHub нужен вход в твой аккаунт GitHub или готовый URL репозитория.

## 2. Flask/FastAPI

- [x] В репозитории создано FastAPI-приложение.
- [x] Основной файл приложения: `app/main.py`.
- [x] Добавлены endpoints:
  - `/`
  - `/health`
  - `/metrics`
- [x] Добавлены тесты приложения: `tests/test_main.py`.
- [x] Приложение закоммичено в git.
- [ ] Коммит запушен на GitHub.

Статус: FastAPI-часть выполнена локально.

## 3. Docker / Docker Compose

- [x] Добавлен `Dockerfile` для FastAPI-приложения.
- [x] Docker-образ приложения собран локально: `sharay-fastapi:local`.
- [x] Контейнер приложения запускался локально.
- [x] `/health` внутри контейнера проверен, вернул `ok`.
- [x] Добавлен `docker-compose.yml`.
- [x] В `docker-compose.yml` добавлены контейнеры:
  - FastAPI-приложение
  - Prometheus
  - Grafana
- [x] Добавлен конфиг Prometheus: `monitoring/prometheus/prometheus.yml`.
- [x] Добавлен datasource Prometheus для Grafana: `monitoring/grafana/provisioning/datasources/prometheus.yml`.
- [x] `docker compose config` успешно прошел.
- [x] Образы Prometheus и Grafana скачаны через Docker.
- [ ] Docker Compose файл запушен на GitHub.
- [ ] Dockerfile запушен на GitHub.
- [ ] Docker-образ запушен на Docker Hub.

Статус: Docker-часть выполнена локально. Для Docker Hub push нужен твой Docker Hub username и авторизация.

## 4. Kubernetes

- [x] Подготовлены k8s-манифесты.
- [x] Добавлен namespace: `k8s/namespace.yaml`.
- [x] Добавлен service: `k8s/service.yaml`.
- [x] Добавлен deployment: `k8s/deployment.yaml`.
- [x] Добавлен ingress: `k8s/ingress.yaml`.
- [x] В deployment указан pull образа из Docker Hub:
  `docker.io/your-dockerhub-username/sharay-fastapi:latest`.
- [x] YAML-файлы успешно распарсены локальной проверкой.
- [ ] Манифесты запушены на GitHub.
- [ ] Docker Hub username заменен на реальный.

Статус: манифесты готовы. Нужно заменить `your-dockerhub-username` после выбора Docker Hub аккаунта.

## 5. Terraform

- [x] Подготовлены Terraform-манифесты.
- [x] Добавлен provider Yandex Cloud: `terraform/main.tf`.
- [x] Добавлено создание виртуальной машины.
- [x] Добавлен web-сервер Nginx через cloud-init.
- [x] Добавлен запуск Docker-контейнера сервиса на VM через cloud-init.
- [x] Добавлены переменные: `terraform/variables.tf`.
- [x] Добавлены output-значения: `terraform/outputs.tf`.
- [ ] Terraform применен в облаке.

Статус: Terraform-файлы готовы. Применение требует реальные `cloud_id`, `folder_id`, `subnet_id`, SSH key и установленный Terraform CLI.

## 6. Ansible

- [x] Подготовлен Ansible playbook: `ansible/deploy.yml`.
- [x] Добавлен пример inventory: `ansible/inventory.example.ini`.
- [x] Добавлены переменные деплоя: `ansible/group_vars/all.yml`.
- [x] Добавлен шаблон Docker Compose для сервера.
- [x] Добавлен шаблон Nginx reverse proxy.
- [x] Playbook устанавливает Docker и Nginx.
- [x] Playbook доставляет compose-файл на сервер.
- [x] Playbook запускает контейнер сервиса на сервере.
- [ ] Ansible playbook выполнен на сервере, созданном Terraform.

Статус: Ansible-часть готова. Выполнение требует IP сервера после Terraform и доступ по SSH.

## Проверки, которые уже выполнены

- [x] `ruff check .`
- [x] `pylint app tests`
- [x] `bandit -r app`
- [x] `pytest`
- [x] `docker build -t sharay-fastapi:local .`
- [x] Запуск контейнера и проверка `http://127.0.0.1:8000/health`
- [x] `docker compose config`
- [x] Парсинг YAML-файлов

## Что осталось сделать для полной сдачи

- [ ] Войти в GitHub.
- [ ] Создать GitHub-репозиторий.
- [ ] Добавить remote `origin`.
- [ ] Запушить ветку `main`.
- [ ] Войти в Docker Hub.
- [ ] Заменить `your-dockerhub-username` на реальный username.
- [ ] Собрать Docker-образ с Docker Hub тегом.
- [ ] Запушить Docker-образ на Docker Hub.
- [ ] Обновить k8s/Terraform/Ansible ссылку на реальный Docker Hub image.
- [ ] При необходимости применить Terraform.
- [ ] При необходимости выполнить Ansible на созданной VM.
