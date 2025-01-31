
FROM python:3.9-slim

#wd
WORKDIR .

#python dep
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

#copy
COPY app.py .
COPY models/ models/

#no root
RUN useradd -m appuser && \
    chown -R appuser:appuser /app
USER appuser

#envy
ENV PYTHONUNBUFFERED=1
ENV PORT=5000

#p
EXPOSE 5000


CMD python app.py
