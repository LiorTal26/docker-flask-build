from flask import Flask, jsonify, request, send_from_directory
from dotenv import load_dotenv
import os
import logging

load_dotenv()
app = Flask(__name__, static_folder='static')

# Configure logging
logging.basicConfig(level=logging.INFO)

@app.route('/')
def home():
    app.logger.info("Visited Home Page")
    return '''
        <html>
        <head>
            <link rel="stylesheet" type="text/css" href="/static/styles.css">
        </head>
        <body>
            <h1>Welcome to Flask in Docker!</h1>
            <p>Use <a href="/about">/about</a> or <a href="/api/data">/api/data</a></p>
            <p>My secret: <a href="/secret">/secret</a></p>
        </body>
        </html>
    '''

@app.route('/secret')
def secret():
    app.logger.info("Visiting secret page")
    return f"API_KEY: {os.getenv('API_KEY')}, ENV: {os.getenv('ENVIRONMENT')}"

@app.route('/about')
def about():
    app.logger.info("Visited About Page")
    return '''
        <html>
        <head>
            <link rel="stylesheet" type="text/css" href="/static/styles.css">
        </head>
        <body>
            <h2>About This App</h2>
            <p>This is a simple Flask app running inside a Docker container.</p>
        </body>
        </html>
    '''

@app.route('/api/data')
def api_data():
    app.logger.info("API request received from: %s", request.remote_addr)
    sample_data = {
        "message": "Hello, this is sample JSON data!",
        "status": "success",
        "items": ["Flask", "Docker", "Python"]
    }
    return jsonify(sample_data)

@app.errorhandler(404)
def not_found(e):
    return '''
        <html>
        <head>
            <link rel="stylesheet" type="text/css" href="/static/styles.css">
        </head>
        <body>
            <h1>404 - Page Not Found</h1>
            <p>Try going back to <a href="/">home</a>.</p>
        </body>
        </html>
    ''', 404

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=4000)
