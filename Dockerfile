FROM python:3.11

WORKDIR /app

COPY requirements.txt .

# Upgrade pip first
RUN pip install --upgrade pip

# Install typing-extensions first
RUN pip install --no-cache-dir typing-extensions==4.5.0

# Install all dependencies
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 8000
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
