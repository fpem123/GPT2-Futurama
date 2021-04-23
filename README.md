# GPT2 Futurama

[![Run on Ainize](https://ainize.ai/images/run_on_ainize_button.svg)](https://ainize.web.app/redirect?git_repo=https://github.com/fpem123/GPT2-Futurama)

This project generate Futurama script using GPT-2 model.

You can download the model here: [google drive](https://drive.google.com/file/d/1-Nd9RA1C3DngCL-asY_08aveN7y-UYm5/view?usp=sharing)

Fine tuning data: [Kaggle](https://www.kaggle.com/josephvm/futurama-seasons-16-transcripts?select=only_spoken_text.csv)

### Model information

    Base model: gpt-2 large
    Epoch: 30
    Train runtime: 2826.5997 secs
    Loss: 0.0244

### How to use

    * First, Choose Futurama character name.
    * Second, Fill what the character will say in text. This will be base of script.
    * And then, Fill number in length. Text is created as long as "length". I recommend between 100 and 300.
    * If length is so big, generate time will be long.

### Post parameter

    name: The Futurama character name.
    text: The base of script.
    length: The size of generated text. (min: 50)

### Output foramt

    {"0": [[character name, dialog], [character name, dialog], ...]}


### Image reference

[static/README.md](https://github.com/fpem123/GPT2-Futurama/blob/master/static/README.md)

## * With CLI *

#### Input example

    curl -X POST "https://master-gpt2-futurama-fpem123.endpoint.ainize.ai/futurama" -H "accept: application/json" -H "Content-Type: multipart/form-data" -F "name=Fry" -F "text=Hello," -F "length=50"

#### Output example

    {
      "0": [
        [
          "Fry",
          " Hello, there."
        ],
        [
          "Leela",
          " Good to see you."
        ],
        [
          "Fry",
          " You?"
        ],
        [
          "Leela",
          " And me."
        ],
        ...
      ]
    }

## * With swagger *

API page: [Ainize](https://ainize.ai/fpem123/GPT2-Futurama?branch=master)

## * With a Demo *

Demo page: [End-point](https://master-gpt2-futurama-fpem123.endpoint.ainize.ai/)
