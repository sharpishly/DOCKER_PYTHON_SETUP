from flask import Flask

app = Flask(__name__)

@app.route('/')
def home():
    return '<html><body style="background-color:black;"><h1 style="color:white;">Hello from Flask!</h1></body></html>'

if __name__ == "__main__":
    app.run(host='0.0.0.0')
