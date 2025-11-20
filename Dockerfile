FROM python:3.9-slim
WORKDIR /app
COPY hello.py .
# The -u flag ensures that the output is unbuffered and appears in real-time
CMD ["python", "-u", "hello.py"]