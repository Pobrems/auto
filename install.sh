DADOS="dados_bot.php"
API="smsActivate.php"
RED=$"\033[0;31m"
GREEN=$"\033[0;32m"
 
##############################################
echo -e "${RED}Instalando Dependncias...."
if ! [ -x "$(command -v zip)" ]; then
echo -e "${RED}Instalando Zip"
apt install zip -y > /dev/null 2>&1
clear
else
clear
fi
wait
if ! [ -x "$(command -v screen)" ]; then
echo -e "${RED}Instalando Screen"
apt install screen -y > /dev/null 2>&1
clear
else
clear 
fi
wait
if ! [ -x "$(command -v redis)" ]; then
echo -e "${RED}Instalando Redis"
apt install redis -y > /dev/null 2>&1
clear
else
clear
fi
wait
if ! [ -x "$(command -v sqlite3)" ]; then
echo -e "${RED}Instalando Sqlite3"
apt install sqlite3 -y > /dev/null 2>&1
clear
else
clear
fi 
wait
if ! [ -x "$(command -v php-redis)" ]; then
echo -e "${RED}Instalando Php-redis"
apt install php-redis -y > /dev/null 2>&1
clear
else
clear
fi
wait
if ! [ -x "$(command -v php-curl)" ]; then
echo -e "${RED}Instalando Php-curl"
apt install php-curl -y > /dev/null 2>&1
clear
else
clear
fi
wait
if ! [ -x "$(command -v php-sqlite3)" ]; then
echo -e "${RED}Instalando Php-sqlite3" 
apt install php-sqlite3 -y > /dev/null 2>&1
clear
else
clear -e "${GREEN}Dependencias Instaladas"
fi
##############################################
echo -e "${GREEN}Informe seu token bot"
read token
echo -e "${GREEN}informe sua api sms"
read api
echo -e "${GREEN}informe sua api mercado pago"
read apim
echo -e "${GREEN}informe o id do admin"
read admin
echo -e "${GREEN}informe o id do grupo de notificação"
read not
echo -e "${GREEN}informe o id do grupo do bot"
read bot
clear
##############################################
echo -e "${GREEN}Instalando....."
git clone https://github.com/Pobrems/sms > /dev/null 2>&1
cd sms
cd includes
sed -i -e "s/TOKEN BOT DO TG/$token/g" $DADOS
sed -i -e "s/KEY DO SMS-ACTUVE/$api/g" $DADOS
sed -i -e "s/TOKEN MERCADO PAGO/$apim/g" $DADOS
sed -i -e "s/ID DO ADMIN/$admin/g" $DADOS
sed -i -e "s/ID DO GRUPO DE NOTIFICAÇÕES/$not/g" $DADOS
sed -i -e "s/ID DO GRUPO/$bot/g" $DADOS
sed -i -e "s/KEY DO SMS-ACTIVE/$api/g" $API
clear
echo -e "${RED}Instalado deseja rodar o bot? sim or nao"
read op
       case $op in
               sim|s)
       screen -XS pagamentos quit > /dev/null
       screen -XS processos quit > /dev/null
       screen -XS alertas quit > /dev/null
       screen -XS botsms quit > /dev/null
       screen -dmS pagamentos sh inicia_pagamentos.sh
       screen -dmS processos sh inicia_processos.sh
       screen -dmS alertas sh inicia_alertas.sh
       screen -dmS botsms sh inicia_bot.sh
       echo -e "${GREEN}Bot Iniciado"                        
       ;;
               nao|n)
       exit
       ;;
esac
#######################END#########################