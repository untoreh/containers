FROM untoreh/chisel-ubu

RUN apt update && \
  curl https://install.citusdata.com/community/deb.sh | bash && \
  apt -y -q install postgresql-9.6-citus && \
  echo "ver=$(ls /etc/postgresql/ | head -1)" >> /etc/.pg && \
  echo "clu=$(ls /etc/postgresql/$ver/ | head -1)" >> /etc/.pg && \
  rm -rf /var/lib/postgresql /var/lib/apt/lists /etc/postgresql/*/*

COPY pg_hba.conf /etc/pg_hba.conf
ADD create_ext.sh /usr/local/bin/
ADD services.d /etc/services.d/

CMD ["/init"]
