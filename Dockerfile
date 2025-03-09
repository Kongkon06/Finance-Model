FROM python:3.11

WORKDIR /app

COPY . .

# Upgrade pip first
RUN pip install --upgrade pip

# Install dependencies manually to avoid version conflicts
RUN RUN pip install --no-cache-dir fastapi uvicorn tensorflow pandas scikit-learn numpy joblib pydantic python-multipart Flask flask-cors matplotli shap

EXPOSE 8000

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
