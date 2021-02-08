FROM pytorch/pytorch:1.7.0-cuda11.0-cudnn8-devel

RUN apt-get update && \
    apt-get install -y && \
    apt-get install -y apt-utils wget && \
    apt-get -qq -y install curl && \
    apt-get install -y unzip

RUN pip install --upgrade pip
RUN pip install transformers
RUN pip install flask
RUN pip install waitress

RUN mkdir -p /app
WORKDIR /app
COPY . .

RUN curl -c ./cookie -s -L "https://drive.google.com/uc?export=download&id=1-Nd9RA1C3DngCL-asY_08aveN7y-UYm5" > /dev/null
RUN curl -Lb ./cookie "https://drive.google.com/uc?export=download&confirm=`awk '/download/ {print $NF}' ./cookie`&id=1-Nd9RA1C3DngCL-asY_08aveN7y-UYm5" -o GPT2-large_futurama.tar
RUN tar -xvf GPT2-large_futurama.tar
RUN rm GPT2-large_futurama.tar

EXPOSE 80

CMD ["python3", "main.py"]