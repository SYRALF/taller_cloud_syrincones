
FROM python:3.9


WORKDIR /app


COPY ["./", "/app/"]


RUN pip install --no-cache-dir fastapi uvicorn


EXPOSE 8000

# Comando para ejecutar la aplicación
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]