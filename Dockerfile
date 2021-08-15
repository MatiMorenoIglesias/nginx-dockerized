FROM ubuntu:latest
RUN apt update -y && \
	apt install nginx vim -y
COPY sites-available/* /etc/nginx/sites-available
RUN mkdir /var/www/home && mkdir /var/www/contacto
COPY www /var/www
RUN ln -s /etc/nginx/sites-available/home.mmoreno.com /etc/nginx/sites-enabled/home.mmoreno.com && \
	  ln -s /etc/nginx/sites-available/contacto.mmoreno.com /etc/nginx/sites-enabled/contacto.mmoreno.com
EXPOSE 80
CMD ["/usr/sbin/nginx", "-g", "daemon off;"]
