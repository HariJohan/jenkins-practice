# 1. Use a lightweight Python image
FROM python:3.12-slim

# 2. Set the working directory inside the container
WORKDIR /app

# 3. Copy only requirements first (Better for build caching)
COPY requirements.txt .

# 4. Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# 5. Copy the rest of your application code
COPY . .

# 6. Tell Docker which port the app runs on
EXPOSE 5000

# 7. The command to run your app
CMD ["python", "app.py"]
