FROM python:3.9

WORKDIR /app


COPY . /app


RUN pip install --upgrade pip && \
    pip install --trusted-host pypi.org \
                --trusted-host pypi.python.org \
                --trusted-host files.pythonhosted.org \
                flask==3.0.0 \
                prometheus_flask_exporter

# הרצת האפליקציה
CMD ["python", "app.py"]
