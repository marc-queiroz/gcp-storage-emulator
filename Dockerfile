FROM python:alpine

# Permite que logs apareçam imediatamente
ENV PYTHONUNBUFFERED=1
ENV APP_HOME=/app
ENV PORT=8080
ENV HOST=0.0.0.0
ENV STORAGE_BASE=/
ENV STORAGE_DIR=storage

WORKDIR $APP_HOME

# Instale dependências do sistema se necessário (exemplo: gcc, libpq-dev)
# RUN apt-get update && apt-get install -y --no-install-recommends gcc && rm -rf /var/lib/apt/lists/*

# Copie apenas arquivos de dependências primeiro para melhor cache
COPY pyproject.toml setup.py ./
RUN pip install --no-cache-dir .

# Agora copie o restante do código
COPY README.md ./
COPY src src/

ENTRYPOINT ["gcp-storage-emulator"]
CMD ["start"]
