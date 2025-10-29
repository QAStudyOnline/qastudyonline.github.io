#!/usr/bin/env python3
"""
Custom HTTP server that serves 404.html for missing pages
"""

import http.server
import socketserver
import os
import urllib.parse

class CustomHTTPRequestHandler(http.server.SimpleHTTPRequestHandler):
    def do_GET(self):
        # Parse the URL path
        parsed_path = urllib.parse.urlparse(self.path)
        path = parsed_path.path
        
        # Remove leading slash
        if path.startswith('/'):
            path = path[1:]
        
        # If path is empty, serve index.html
        if not path:
            path = 'index.html'
        
        # Check if file exists
        if os.path.exists(path):
            # File exists, serve it normally
            super().do_GET()
        else:
            # File doesn't exist, serve 404.html
            self.send_response(404)
            self.send_header('Content-type', 'text/html')
            self.end_headers()
            
            # Try to serve 404.html
            if os.path.exists('404.html'):
                with open('404.html', 'rb') as f:
                    self.wfile.write(f.read())
            else:
                # Fallback 404 message
                self.wfile.write(b'''
                <!DOCTYPE html>
                <html>
                <head>
                    <title>404 - Page Not Found</title>
                    <style>
                        body { font-family: Arial, sans-serif; text-align: center; padding: 50px; }
                        h1 { font-size: 3rem; color: #333; }
                        p { font-size: 1.2rem; color: #666; }
                    </style>
                </head>
                <body>
                    <h1>404</h1>
                    <p>Page Not Found</p>
                    <p>The page you're looking for doesn't exist.</p>
                    <a href="/">Go Home</a>
                </body>
                </html>
                ''')

def main():
    PORT = 8001
    
    with socketserver.TCPServer(("", PORT), CustomHTTPRequestHandler) as httpd:
        print(f"Server running at http://localhost:{PORT}")
        print("Press Ctrl+C to stop the server")
        try:
            httpd.serve_forever()
        except KeyboardInterrupt:
            print("\nServer stopped.")

if __name__ == "__main__":
    main() 