#!/bin/bash

# Запрос кто я.
echo "Вывод кто я: $(whoami)"

# Сборка нового образа
mkdir -p /opt/docker/nginxmk1
cd /opt/docker/nginxmk1
touch Dockerfile
cat << EOF > Dockerfile
	FROM centos:7
	MAINTAINER MikhailK <mk_0@bk.ru>
	ENV TZ=Europe/Moscow

	RUN yum install -y epel-release && yum install -y nginx
	RUN yum clean all
	RUN echo "daemon off;" >> /etc/nginx/nginx.conf
	#RUN echo "<html><head>Hey, Netology</head><body><h1>DevOps Engineer!</h1></body></html>" > /usr/share/nginx/html/index.html
	RUN sed -i "0,/nginx/s/nginx/docker-nginx/i" /usr/share/nginx/html/index.html

	CMD [ "nginx" ]

EOF

docker build -t mikhailk/nginx:1.0.0 .
