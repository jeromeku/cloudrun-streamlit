FROM python:3.9-slim

ENV PORT=8080
ENV ADDRESS=0.0.0.0
EXPOSE ${PORT}

WORKDIR /app

RUN apt-get update && apt-get install -y \
    build-essential \
    software-properties-common \
    git \
    && rm -rf /var/lib/apt/lists/*

COPY . /app/

RUN pip3 install -r requirements.txt

CMD streamlit run app.py --server.port=${PORT} --server.address=${ADDRESS}
