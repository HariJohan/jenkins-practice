from flask import Flask

app = Flask(__name__)

@app.route('/')
def hello_world():
    return '<h1>Hello!</h1><p>Running locally on Python 3.14</p>'

if __name__ == '__main__':
    # Running on port 5000
    app.run(host='0.0.0.0', port=5000)
