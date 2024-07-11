# Dockerfile

#Base Image
FROM ubuntu AS builder

RUN apt-get update && apt-get install -y python3 python3-pip

WORKDIR /app

COPY calculator.py /app

# Here we do the magic of Multi Stage Build!

FROM ubuntu AS runtime 

COPY --from=builder /app /app

WORKDIR /app

CMD ["python3", "calculator.py"]
