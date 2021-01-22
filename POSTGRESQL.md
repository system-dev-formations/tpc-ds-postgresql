# Install postgresql 

## Par package 
```shell
sudo apt update
sudo apt -y upgrade
sudo apt install -y postgresql postgresql-client postgresql-contrib
```
Apres l'installation on peux lancer le serveur, l'arreter et le mettre a disposition apres
chaque reboot
```shell
sudo systemctl stop postgresql.service
sudo systemctl start postgresql.service
# sudo systemctl enable postgresql.service
sudo systemctl status postgresql.service
```

## Installation a partir du code source
```shell
wget https://ftp.postgresql.org/pub/source/v13.1/postgresql-13.1.tar.gz
cd postgresql-13.1
 ./configure --prefix=/opt/pgsql131 --with-python
 make -j`nproc`
 # make contrib
 cd contrib
 make -j`nproc`
 make check
 cd ..
 make check
 sudo make install
 cd contrib
 sudo make install 
```
## Preparation des directories data et binaire de postgresql
```shell
 mkdir -p /opt/pg/data
 chown -R postgres:postgres /opt/pg/data 
 chown -R postgres:postgres /opt/pgsql131/
 ln -s /opt/pgsql131/ /opt/postgresql
 chown -R postgres:postgres /opt/postgresql
```
## Changer l'acces au binaire de l'utilisateur postgres
```shell
sudo -s
su postgres
vi .profile
# ajouter le path 
export PATH=/opt/postgresql/bin:$PATH
# save and quit
source .profile
```
## Creation du cluster postgresql
Un cluster est un ensemble de bases de donnees gerees par une meme instance du serveur.
```shell
initdb -k -D /opt/pg/data  # k permet un checksum des pages de data
```
## Lancer le serveur
```shell
export PGDATA=/opt/pg/data
pg_ctl start -D ${PGDATA}
```
## Changer le fichier postgresql.conf
```shell
cd /opt/pg/data
vi postgresql.conf
# allez a ligne 59
listen_addresses = '*'
# save and quit
```
## mettre un password pour le user postgres
```shell
psql
ALTER USER postgres WITH PASSWORD 'password';
```
## changer le fichier pg_hba.conf
```shell
# add 
host  all  all  90.48.68.82/32  md5
```
## reload de la configuration 
```shell
pg_ctl reload -D ${PGDATA}
```




