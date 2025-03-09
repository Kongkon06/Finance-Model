FROM python:3.11

WORKDIR /app

COPY . .

# Upgrade pip first
RUN pip install --upgrade pip

# Install `typing-extensions` first to avoid conflicts
RUN pip install --no-cache-dir typing-extensions==4.5.0

# Install other dependencies in a separate step
RUN pip install --no-cache-dir \
    fastapi==0.103.1 \
    uvicorn==0.23.2 \
    tensorflow==2.13.0 \
    pandas==2.0.3 \
    scikit-learn==1.3.0 \
    numpy==1.24.3 \
    joblib==1.3.2 \
    pydantic==2.4.2 \
    python-multipart==0.0.6 \
    Flask==2.3.2 \
    flask-cors==3.0.10 \
    matplotlib==3.7.1 \
    shap==0.44.0 

EXPOSE 8000

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
