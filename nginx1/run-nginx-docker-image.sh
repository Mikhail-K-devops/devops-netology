docker run -it -p 80:80 \
    -v /devops-netology/nginx1/static://usr/share/nginx/html:ro \
    nginx:alpine
