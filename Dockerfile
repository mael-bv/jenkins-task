# Utiliser une image Alpine pour un conteneur léger
FROM alpine:latest

# Installer Python et pip
RUN apk add --no-cache python3 py3-pip bash

# Créer un environnement virtuel et installer les dépendances dans cet environnement
RUN python3 -m venv /opt/venv \
    && . /opt/venv/bin/activate \
    && pip install --upgrade pip

# Ajouter et installer les dépendances supplémentaires
ADD ./webapp/requirements.txt /tmp/requirements.txt
RUN . /opt/venv/bin/activate && pip install --no-cache-dir -r /tmp/requirements.txt

# Ajouter l'environnement virtuel au PATH
ENV PATH="/opt/venv/bin:$PATH"

# Ajouter l'application
COPY ./webapp /app
WORKDIR /app

# Démarrer l'application
CMD ["python3", "app.py"]
