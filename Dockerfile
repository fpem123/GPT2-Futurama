FROM pytorch/pytorch:1.6.0-cuda10.1-cudnn7-runtime

RUN apt-get update && \
    apt-get install -y && \
    apt-get install -y apt-utils wget && \
    apt-get -qq -y install curl && \
    apt-get install -y tar

RUN pip install --upgrade pip && \
    pip install transformers && \
    pip install flask && \
    pip install waitress

WORKDIR /app
COPY . .

RUN curl -c ./cookie -s -L "https://drive.google.com/uc?export=download&id=1-Nd9RA1C3DngCL-asY_08aveN7y-UYm5" > /dev/null
RUN curl -Lb ./cookie "https://drive.google.com/uc?export=download&confirm=`awk '/download/ {print $NF}' ./cookie`&id=1-Nd9RA1C3DngCL-asY_08aveN7y-UYm5" -o GPT2-large_futurama.tar
RUN tar -xvf GPT2-large_futurama.tar
RUN rm GPT2-large_futurama.tar

EXPOSE 80

CMD ["python3", "main.py"]
