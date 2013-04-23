upstream rack_upstream {
  server 127.0.0.1:8000;
}

server {
  listen 80;
  server_name slc.io;
  charset UTF-8;

  location / {
    proxy_pass http://rack_upstream;
    proxy_redirect     off;
    proxy_set_header   Host             $host;
    proxy_set_header   X-Real-IP        $remote_addr;
    proxy_set_header   X-Forwarded-For  $proxy_add_x_forwarded_for;
  }

  error_page 500 502 503 504 /500.html;
  client_max_body_size 1M;
  keepalive_timeout 10;
}
