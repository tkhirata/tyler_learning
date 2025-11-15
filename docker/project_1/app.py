from bottle import route, run

@route('/<name>')
def hello(name='stranger'):
    return name

if __name__ == '__main__':
    run(host='0.0.0.0', port=8080, debug=True)
