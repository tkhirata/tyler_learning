from bottle import route, run
import requests

@route('/hello')
def hello():
    return 'Hello World!'

if __name__ == '__main__':
    run(host='0.0.0.0', port=8080, debug=True)
