#!/bin/sh

# Inicia o postgres dentro do container docker
sudo service postgresql start

# Cria o usuário e banco e executa o INIT.sql onde está a atribuição de privilégios
sudo -u postgres createuser tpch
sudo -u postgres createdb tpchdb
sudo -u postgres psql -d postgres -f INI.sql  
python3 tpch_pgsql/tpch_pgsql.py -d tpchdb -U postgres -W postgres prepare
python3 tpch_pgsql/tpch_pgsql.py -d tpchdb -U postgres -W postgres load


exec "$@"