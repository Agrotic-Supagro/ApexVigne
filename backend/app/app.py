from typing import List, Dict
from flask import Flask
import mysql.connector
import os
import logging
from dotenv import load_dotenv
load_dotenv()

app = Flask(__name__)

@app.route('/')
def hello_world():
    app.logger.info('Hello, World!')
    return 'Hello, World!'

@app.route('/test')
def main():
    app.logger.info(os.getenv("MYSQL_USER"))
    config = {
        'user': os.getenv("MYSQL_USER"),
        'password': os.getenv("MYSQL_PASSWORD"),
        'host': 'db',
        'port': '3306',
        'database': os.getenv("MYSQL_DATABASE")
    }
    connection = mysql.connector.connect(**config)
    cursor = connection.cursor()
    cursor.execute('SELECT * FROM parcelle')
    cursor.fetchall()
    number_of_rows = cursor.rowcount
    app.logger.info(number_of_rows)
    cursor.close()
    connection.close()
    return 'nombre de parcelles : ' + str(number_of_rows)


if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0')