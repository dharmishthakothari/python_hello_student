# Step 1 — Base image
FROM python:3.11-slim

# Step 2 — Set working directory
WORKDIR /app

# Step 3 — Copy requirement file
COPY requirements.txt .

# Step 4 — Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Step 5 — Copy application code
COPY app.py .

# Step 6 — Expose the port
EXPOSE 5000

# Step 7 — Start the Flask app
CMD ["python", "app.py"]
