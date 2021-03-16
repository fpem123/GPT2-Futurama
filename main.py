'''
    Name: main.py
    Writer: Hoseop Lee, Ainizer
    Rule: Flask app server
    update: 21.02.08
'''

from flask import Flask, request, jsonify, render_template
import requests
import json

app = Flask(__name__)

##
# Get post request page.
@app.route('/futurama', methods=['POST'])
def generate():
    try:
        name = request.form['name']
        text = request.form['text']
        length = int(request.form['length'])
        URL = 'https://feature-add-torch-serve-gpt-2-server-gkswjdzz.endpoint.ainize.ai/infer/gpt2-large_Futurama_50'
        headers = {
            'Content-Type': 'application/json'
        }
        res = requests.post(URL, headers=headers, data=json.dumps({
            'text': f'{name}: {text}',
            'num_samples': 1,
            'length': length
        }))

        sample_outputs = res.json()

        result = []
        futurama_stories = sample_outputs['0'].split('\n')

        for idx, futurama_story in enumerate(futurama_stories):
            if idx == len(futurama_stories) - 1:
                break
            if futurama_story and ': ' in futurama_story:
                    splitted = futurama_story.split(':')
                    print(splitted[0],splitted[1])
                    result.append([splitted[0], splitted[1]])
            else:
                continue

        return jsonify({0: result}), 200
    except Exception as e:
        return jsonify({'message': e}), 500


##
# Queue deadlock error debug page.
@app.route('/queue_clear')
def queue_clear():
    while not requests_queue.empty():
        requests_queue.get()

    return "Clear", 200


##
# Sever health checking page.
@app.route('/healthz', methods=["GET"])
def health_check():
    return "Health", 200


##
# Main page.
@app.route('/')
def main():
    return render_template('main.html'), 200


if __name__ == '__main__':
    app.run(port=8000, host='0.0.0.0', threaded=True)
