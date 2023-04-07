FROM ubuntu:latest
MAINTAINER kundan.k845438@gmail.com
RUN apt-get update && apt-get install -y apache2 && apt-get install -y unzip
WORKDIR /var/www/html/
ADD https://www.free-css.com/assets/files/free-css-templates/download/page287/cakezone.zip /var/www/html/
RUN unzip cakezone.zip
RUN cp -rvf cake-shop-website-template/* .

EXPOSE 8:0

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]