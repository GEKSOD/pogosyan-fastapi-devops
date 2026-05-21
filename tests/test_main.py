from fastapi.testclient import TestClient

from app.main import app

client = TestClient(app)


def test_read_root_returns_service_metadata() -> None:
    response = client.get("/")

    assert response.status_code == 200
    assert response.json()["service"] == "SHARAY FastAPI Service"


def test_read_health_returns_ok() -> None:
    response = client.get("/health")

    assert response.status_code == 200
    assert response.json() == {"status": "ok"}


def test_read_metrics_exposes_prometheus_metrics() -> None:
    response = client.get("/metrics")

    assert response.status_code == 200
    assert "sharay_http_requests_total" in response.text
