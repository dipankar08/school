#counple of lines to boot your app.

import pdb
from flask import Flask, request, send_from_directory

app = Flask(__name__)


@app.route('/', defaults={'path': 'index.html'})
@app.route('/<path:path>')
def catch_all(path):
    return send_from_directory('html', path)


@app.route('/js/<path:path>')
def send_js(path):
    return send_from_directory('js', path)

@app.route('/css/<path:path>')
def send_css(path):
    return send_from_directory('css', path)

@app.route('/img/<path:path>')
def send_img(path):
    return send_from_directory('img', path)

@app.route('/html/<path:path>')
def send_html(path):
    return send_from_directory('html', path)

@app.errorhandler(404)
def page_not_found(e):
    return "File not found : 404("+str(e)+")"
    
@app.errorhandler(500)
def page_not_found(e):
    return "Internal error : 500("+str(e)+")"
    
if __name__ == "__main__":
  app.run(host="0.0.0.0", port=80)
