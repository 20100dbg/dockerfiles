import gevent
from flask import Flask, request, make_response
from flask_socketio import SocketIO, emit

app = Flask(__name__)
socketio = SocketIO(app, cors_allowed_origins='*',async_mode='gevent')

@app.route("/")
def main():
    tpl = open('main.html', 'r').read()
    #tpl="Hello world"
    response = make_response(tpl)
    response.headers["Cache-Control"] = "no-cache, no-store, must-revalidate"
    return response


#Can be called from JS
@socketio.on('call_server')
def process_data(params):
    data_id = int(params['id'])
    data_str = params['str']

    reverse = data_str[::-1]

    #Call JS
    socketio.emit('receive_from_server', {'result': reverse})


