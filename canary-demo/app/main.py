import os
from flask import Flask, jsonify

app = Flask(__name__)

APP_VERSION = os.getenv("APP_VERSION", "v1")


@app.route("/")
def home():
    return jsonify({
        "application": "istio-canary-demo",
        "version": APP_VERSION,
        "message": f"Hello from application {APP_VERSION}"
    })


@app.route("/health")
def health():
    return jsonify({
        "status": "healthy",
        "version": APP_VERSION
    })


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8080)