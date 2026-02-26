from fastapi import FastAPI
from prometheus_client import Counter, generate_latest, CONTENT_TYPE_LATEST
from starlette.responses import Response

app = FastAPI()

requests_total = Counter("requests_total", "Total HTTP requests")

@app.get("/")
def root():
    requests_total.inc()
    return {"message": "HelloKube says hi 👋"}

@app.get("/healthz")
def healthz():
    return {"ok": True}

@app.get("/ready")
def ready():
    return {"ready": True}

@app.get("/metrics")
def metrics():
    return Response(generate_latest(), media_type=CONTENT_TYPE_LATEST)