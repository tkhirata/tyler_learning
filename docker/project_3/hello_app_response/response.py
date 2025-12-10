from bottle import route, run
import requests

@route('/hello/response')
def response():

    hello_app_response = requests.get('http://hello_app:8080/hello')
    response_time = hello_app_response.elapsed.total_seconds()

    response = f"Hello App Response: {hello_app_response.text}<br>Proxy Response Time: {response_time}"

    return response

if __name__ == '__main__':
    run(host='0.0.0.0', port=8081, debug=True)
