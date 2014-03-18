#!/bin/bash
clear
echo "-------------------------------------------------------------------------"
echo "Instalando ISPTools"
cd /opt
rm -r /tklweb-cp
mkdir /tklweb-cp
cd /opt/tklweb-cp
echo "Limpando pastas"
rm -r *
echo "OK"
echo "-------------------------------------------------------------------------"
echo "Atualizando Node.js"
npm install -g n
echo "OK"
n stable
echo "OK"
echo "-------------------------------------------------------------------------"
echo "Baixando ISPTools"
git init
echo "OK"
git pull https://giovaneh@bitbucket.org/giovaneh/isptools.git
echo "OK"
echo "-------------------------------------------------------------------------"
echo "Interrompendo instâncias Node.js fantasmas"
killall node
echo "OK"
echo "-------------------------------------------------------------------------"
echo "Instalando PM2"
npm install pm2 -g
echo "OK"
echo "-------------------------------------------------------------------------"
echo "Startando PM2"
pm2 start app.js -i max --name ISPTools
echo "OK"
echo "-------------------------------------------------------------------------"
echo "Daemon PM2"
pm2 startup ubuntu
echo "OK"
echo "-------------------------------------------------------------------------"
echo "FIM"

## wget -qO- https://bitbucket.org/giovaneh/isptools/raw/master/install.sh | sh

