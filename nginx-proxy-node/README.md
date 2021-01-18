#How to run nginx locally?

1- Start to listen 8080

2- Run the following commands


     cd nginx-proxy-node/VERSION_NUMBER_FOLDER
     docker build -t custom-nginx .

3- Run the dockerized ngnix


    docker run --name nginx-cont-random -d -p 8080:8080 custom-nginx
    
4- Open http://localhost:8080 and test your changes     
