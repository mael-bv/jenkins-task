FROM alpine:latest

# Installer Python, pip, et les packages requis
RUN apk add --no-cache python3 py3-pip bash py3-requests py3-flask

# Ajouter et installer les dépendances supplémentaires si nécessaire
ADD ./webapp/requirements.txt /tmp/requirements.txt
RUN pip3 install --no-cache-dir -r /tmp/requirements.txt

# Ajouter votre application ou autres configurations
COPY ./webapp /app
WORKDIR /app

# Démarrer l'application (remplacez par la commande de démarrage de votre app)
CMD ["python3", "app.py"]

