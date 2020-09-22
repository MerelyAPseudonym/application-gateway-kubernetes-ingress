FROM ubuntu:16.04
RUN apt-get update
RUN apt-get install -y ca-certificates openssl
RUN mkdir -p /home/agic
ADD bin/appgw-ingress /
RUN groupadd -r agic &&\
    useradd -r -g agic -d /home/agic -s /sbin/nologin -c "Docker image user" agic
RUN chown -R agic:agic /appgw-ingress
RUN chmod +x /appgw-ingress
CMD ["/appgw-ingress"]
