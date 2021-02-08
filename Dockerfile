FROM leehoseop/gpt2_futurama:1.0

WORKDIR /app
COPY . .

RUN ls

EXPOSE 80

CMD ["python3", "main.py"]
