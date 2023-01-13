DADOS="dados_bot.php"
API="smsActivate.php"
 
#-------------VERIFICANDO INSTALAÇÃO------------#
echo -e "Instalando Dependncias...."
if ! [ -x "$(command -v zip)" ]; then
apt install zip> /dev/null 2>&1
else
echo
fi
if ! [ -x "$(command -v screen)" ]; then
apt install screen> /dev/null 2>&1
else
echo
fi
if ! [ -x "$(command -v redis)" ]; then
apt install redis> /dev/null 2>&1
else
echo
fi
if ! [ -x "$(command -v sqlite3)" ]; then
apt install sqlite3> /dev/null 2>&1
else
echo
fi 
if ! [ -x "$(command -v php-redis)" ]; then
apt install php-redis> /dev/null 2>&1
else
echo
fi
if ! [ -x "$(command -v php-curl)" ]; then
apt install php-curl> /dev/null 2>&1
else
echo
fi
if ! [ -x "$(command -v php-sqlite3)" ]; then
apt install php-sqlite3> /dev/null 2>&1
else
echo -e "Dependencias Instaladas"
fi
#------------------------INSTALACAO DO BOT----------------#
clear
echo -e "Informe seu token bot"
read token
echo -e "informe sua api sms"
read api
echo -e "informe sua api mercado pago"
read apim
echo -e "informe o id do admin"
read admin
echo -e "informe o id do grupo de notificação"
read not
echo -e "informe o id do grupo do bot"
read bot
clear
#-----------END---------#
##################
#Instalaçao
echo -e "Instalando....."
git clone https://github.com/Pobrems/sms
cd sms
cd includes
sed -i -e "s/TOKEN BOT DO TG/$token/g" $DADOS
sed -i -e "s/KEY DO SMS-ACTUVE/$api/g" $DADOS
sed -i -e "s/TOKEN MERCADO PAGO/$apim/g" $DADOS
sed -i -e "s/ID DO ADMIN/$admin/g" $DADOS
sed -i -e "s/ID DO GRUPO DE NOTIFICAÇÕES/$not/g" $DADOS
sed -i -e "s/ID DO GRUPO/$bot/g" $DADOS
clear
cd sms
clear
ls
#echo -e "Instalado deseja rodar o bot? sim or nao"
#read op
#        case $op in
#                1|01)
#        cd sms
#        screen -XS pagamentos quit > /dev/null
#        screen -XS processos quit > /dev/null
#        screen -XS alertas quit > /dev/null
#    screen -XS botsms quit > /dev/null
#        screen -dmS pagamentos sh inicia_pagamentos.sh
#        screen -dmS processos sh inicia_processos.sh
#        screen -dmS alertas sh inicia_alertas.sh
#        screen -dmS botsms sh inicia_bot.sh
#        echo "Bot Iniciado"                        
#        ;;
#                2|02)
#        exit
#        ;;
#esac


