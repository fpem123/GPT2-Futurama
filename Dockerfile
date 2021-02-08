FROM leehoseop/gpt2_futurama:1.0

RUN ls
WORKDIR /app
COPY . .

EXPOSE 80

CMD ["python3", "main.py"]
