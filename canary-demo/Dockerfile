FROM python:3.13-slim

WORKDIR /app

COPY app/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY app/main.py .

ENV APP_VERSION=v1
EXPOSE 8080

RUN useradd --create-home --uid 10001 appuser
USER appuser

CMD ["gunicorn", "--bind", "0.0.0.0:8080", "--workers", "1", "main:app"]