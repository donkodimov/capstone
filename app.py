#!/usr/bin/env python3
""" This is website for my blue deployment"""

from flask import Flask, render_template

APP = Flask(__name__)

@APP.route('/')
def index():
    """Render index template"""
    return render_template('index.html')

if __name__ == '__main__':
    APP.run(debug=True, host='0.0.0.0', port=80)
