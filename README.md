# Docker-ICEcoder
Build using:

`docker build https://github.com/rbelles/Docker-ICEcoder.git#main --tag icecoder:latest`

Then run using:

`docker run -p 8080:80 icecoder:latest`

`docker-compose -f docker-compose.yml up -d`


`version: "3.2"
services:
  icecoder:
    container_name: ICECoder
    image: icecoder:latest
    restart: unless-stopped
    network_mode: bridge
    ports:
      - 8080:80
    volumes:
      - ice:/var/www/html/icecoder
volumes:
  ice:
    driver: local
    driver_opts:
      device: /home/rbelles/ICEcoder
      type: none
      o: bind
`




Then you can visit http://localhost:8080 to see the index.php welcome page.

Go to http://localhost:8080/icecoder to see ICEcoder, create a password and begin coding!

Notes:

This is a single container, which incudes PHP 7.4.10, Apache, ICEcoder and a test index.php page.
