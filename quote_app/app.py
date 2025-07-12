from flask import Flask, jsonify, render_template
import random
from prometheus_client import Counter, generate_latest, CONTENT_TYPE_LATEST

app = Flask(__name__)

# מדד פשוט לספירת קריאות ל- /api/quote
quote_counter = Counter('quote_requests_total', 'Total number of quote API calls')

quotes = [
    {"quote": "אין דבר העומד בפני הרצון.", "author": "הרצל"},
    {"quote": "תהיה השינוי שאתה רוצה לראות בעולם.", "author": "מהטמה גנדי"},
    {"quote": "If you can dream it, you can do it.", "author": "Walt Disney"},
    {"quote": "Your time is limited, so don’t waste it living someone else’s life.", "author": "Steve Jobs"},
    {"quote": "Success usually comes to those who are too busy to be looking for it.", "author": "Henry David Thoreau"}
]

@app.route('/')
def home():
    return render_template('index.html')

@app.route('/api/quote')
def get_quote():
    quote_counter.inc()
    return jsonify(random.choice(quotes))

@app.route('/metrics')
def metrics():
    return generate_latest(), 200, {'Content-Type': CONTENT_TYPE_LATEST}

if __name__ == '__main__':
    app.run(host="0.0.0.0", port=4000)
