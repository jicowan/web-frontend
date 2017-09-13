FROM ubuntu
RUN apt-get update
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash -
RUN apt-get install -y apache2 curl unzip nodejs
WORKDIR /var/www/html
RUN curl -O http://easyautocomplete.com/files/EasyAutocomplete-1.3.5.zip
RUN unzip EasyAutocomplete-1.3.5.zip
RUN npm install easy-autocomplete
COPY search.html /var/www/html/index.html
COPY apache2.conf /etc/apache2
CMD ["apachectl", "-D", "FOREGROUND"]
EXPOSE 80
