from flask import Flask
from datetime import datetime

app = Flask(__name__)

@app.route("/")
def home():
    now = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    return f"Hello Student — Current Date & Time: {now}"

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
