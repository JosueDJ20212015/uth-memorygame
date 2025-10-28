# Imagen base de Python
FROM python:3.12-slim

# Directorio de trabajo
WORKDIR /app

# Instalar dependencias del sistema necesarias para Django y psycopg2
RUN apt-get update && apt-get install -y \
    build-essential libpq-dev && \
    rm -rf /var/lib/apt/lists/*

# Copiar los archivos de requerimientos
COPY requirements.txt .

# Instalar dependencias de Python
RUN pip install --no-cache-dir -r requirements.txt

# Copiar todo el proyecto al contenedor
COPY . .

# Exponer el puerto 8000 (Gunicorn usará este)
EXPOSE 8000

# Comando por defecto para ejecutar Django con Gunicorn
CMD ["gunicorn", "memorygame_project.wsgi:application", "--bind", "0.0.0.0:8000"]
