ARG version=latest
FROM ubuntu:$version
#MAINTAINER JCD "jcd717@outlook.com"

# métadonnées dans l'image visible avec la commande Inspect
LABEL maintainer="JCD <jcd717@outlook.com>" \
      description="test" \
      auteur="bruno dubois"

RUN useradd user1
USER user1

COPY --chown=user1:user1 heartbeat.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh ; 
    #echo coucou >test.txt

ARG hbs=3
ENV HEARTBEATSTEP $hbs


# information de port réseau utile / accessible via inspect (c'est juste de l'info, cela n'impacte pas le fonctionnement)
EXPOSE 1234/udp 4321/tcp

#ENTRYPOINT ["/entrypoint.sh"]
#CMD ["battement"]

CMD ["/entrypoint.sh","battement"]