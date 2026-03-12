FROM python:3.10-alpine
WORKDIR /app
RUN apk add --no-cache gcc musl-dev linux-headers curl
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt
EXPOSE 8081
COPY . .
CMD ["python", "response.py"]
