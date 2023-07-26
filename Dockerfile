FROM python:3.12-rc-alpine3.17

RUN mkdir -p /app

WORKDIR /app

# Install build dependencies
RUN apk add --no-cache gcc musl-dev python3-dev libffi-dev openssl-dev

COPY requirements.txt .

RUN pip install --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

COPY . .

ENV FLASK_RUN_HOST=0.0.0.0

EXPOSE 5000

ENTRYPOINT ["flask", "run"]