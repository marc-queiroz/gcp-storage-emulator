FROM python:alpine

ENV PYTHONUNBUFFERED=1
ENV APP_HOME=/app
ENV PORT=8080
ENV HOST=0.0.0.0
ENV STORAGE_BASE=/
ENV STORAGE_DIR=storage

WORKDIR $APP_HOME

COPY pyproject.toml setup.py README.md ./
COPY src src/

RUN pip install --no-cache-dir .

ENTRYPOINT ["gcp-storage-emulator"]
CMD ["start"]
