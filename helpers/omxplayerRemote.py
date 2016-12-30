# Based on https://gist.github.com/trungly/5889154

# Code to allow remote control of omxplayer via a webpage/ajax, which then overlays omxplayer on the webpage

from BaseHTTPServer import BaseHTTPRequestHandler
import urlparse, json, subprocess, psutil

class GetHandler(BaseHTTPRequestHandler):

    def do_GET(self):
        parsed_path = urlparse.urlparse(self.path)
        message = '\n'.join([
            'Local omxplayer control',
            'Post to this endpoint with a json object containing a key for url and size',
            'Very alpha, but it functions',
            '',
            ])
        self.send_response(200)
        self.send_header("Access-Control-Allow-Origin:","*")
        self.end_headers()
        self.wfile.write(message)
        return

    def do_POST(self):
        content_len = int(self.headers.getheader('content-length'))
        post_body = self.rfile.read(content_len)
        self.send_response(200)
        self.send_header("Access-Control-Allow-Origin:","*")
        self.end_headers()

        data = json.loads(post_body)

        url = data['url']
        self.wfile.write(url)

        size = data['size']
        self.wfile.write(size)


        PROCNAME = "omxplayer.bin"

        for proc in psutil.process_iter():
            # check whether the process name matches
            if proc.name() == PROCNAME:
                proc.kill()

        subprocess.Popen(["/usr/bin/omxplayer", "--timeout", "10", "--win",  size, url])

        return

if __name__ == '__main__':
    from BaseHTTPServer import HTTPServer
    server = HTTPServer(('127.0.0.1', 8080), GetHandler)
    print 'Starting server at http://127.0.0.1:8080'
    server.serve_forever()
