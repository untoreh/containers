FROM untoreh/containers:chisel-ubu

ENV PGDATA=/pgsql/data
ENV PGRUN=/run/pgsql
ENV PGDIR=/pgsql
ENV PGSTARTTIMEOUT=270

RUN apt update && \
  curl https://install.citusdata.com/community/deb.sh | bash && \
  apt -y -q install postgresql-9.6-citus && \
  pg_conftool 9.6 main set shared_preload_libraries citus && \
  pg_conftool 9.6 main set listen_addresses '*'

COPY pg_hba.conf /etc/postgresql/9.6/main/pg_hba.conf
ADD create_ext.sh /usr/local/bin/
ADD services.d /etc/services.d/

CMD ["/init"]
