from flask import Flask
from flask import render_template
import numpy
import json

app = Flask(__name__)

@app.route('/')
def index():
    '''
    Serves index.html at 127.0.0.1:5000/
    '''
    return render_template('index.html')

@app.route('/bars')
def barplot():
    '''
    Visualizes an array of 0-100 scores at 127.0.0.1:5000/bars
    '''
    return render_template('barplot.html')

@app.route('/bars/data')
def plotdata():
    '''
    Remote data dummy to be retrieved by client-side AJAX call
    '''
    scores = numpy.random.randint(100, size=50)
    data = json.dumps(map(int, scores))
    return data

if __name__ == '__main__':
    app.run()
