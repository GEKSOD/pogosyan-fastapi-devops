from fastapi import FastAPI, Response
from prometheus_client import CONTENT_TYPE_LATEST, Counter, generate_latest

from app.config import settings

REQUESTS_TOTAL = Counter(
    "sharay_http_requests_total",
    "Total number of HTTP requests handled by the application",
    ["endpoint"],
)
for endpoint in ("/", "/health"):
    REQUESTS_TOTAL.labels(endpoint=endpoint)

app = FastAPI(title=settings.app_name, version=settings.app_version)


@app.get("/")
def read_root() -> dict[str, str]:
    REQUESTS_TOTAL.labels(endpoint="/").inc()
    return {
        "service": settings.app_name,
        "version": settings.app_version,
        "environment": settings.environment,
    }


@app.get("/health")
def read_health() -> dict[str, str]:
    REQUESTS_TOTAL.labels(endpoint="/health").inc()
    return {"status": "ok"}


@app.get("/metrics")
def read_metrics() -> Response:
    return Response(generate_latest(), media_type=CONTENT_TYPE_LATEST)
