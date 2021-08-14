FROM ubuntu:latest
RUN apt update -y && \
	apt install nginx vim -y
WORKDIR /etc/nginx/sites-available
COPY sites-available/* .
RUN mkdir /var/www/home && \ 
	mkdir /var/www/contacto && \
	echo "Home Page" > /var/www/home/index.html && \
	echo "Contacto Page" > /var/www/contacto/index.html && \
	ln -s /etc/nginx/sites-available/home.mmoreno.com /etc/nginx/sites-enabled/home.mmoreno.com && \
	ln -s /etc/nginx/sites-available/contacto.mmoreno.com /etc/nginx/sites-enabled/contacto.mmoreno.com
EXPOSE 80
#ENTRYPOINT ["/usr/sbin/nginx", "-g", "daemon off;"]
CMD ["/usr/sbin/nginx", "-g", "daemon off;"]
#CMD ["service"," nginx"," reload"]
