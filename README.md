# Docker-ICEcoder
Build using:

docker build -t icecoder/docker .
Then run using:

docker run -p 8080:80 icecoder/docker
Then you can visit http://localhost:8080 to see the index.php welcome page.

Go to http://localhost:8080/icecoder to see ICEcoder, create a password and begin coding!

Notes:

This is a single container, which incudes PHP 7.4.10, Apache, ICEcoder and a test index.php page
