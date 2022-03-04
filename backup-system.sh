#!/bin/bash

#-----------------------------------------------------------------#
# Script Name: Backup System                                      #
# Description: Realiza rotina de backup com interação do usuario  #
# Creator: Marco Antonio da Silva                                 #
# Linkedin: https://www.linkedin.com/marcosilvarj                 #
# E-mail: marcoa.silva84@gmail.com                                #
# Use:                                                            #
#        ./backup-system.sh                                       #
#-----------------------------------------------------------------#

clear

NOMEBKP=$(date +"%H%M%S")

while true; do
    echo "#########################################################"
    echo "############# Bem-vindo ao Backup System ################"
    echo "#########################################################"
    
    echo "Escolha uma opção para continuar:
        (1) Para fazer backup do diretório /etc
	(2) Para fazer backup do diretório /home
	(3) Para fazer backup do diretório /var
	(4) Para fazer backup de um diretório diferente
	(5) Para sair do sistema"

    read RESPOSTA
    case $RESPOSTA in
        1) echo "Fazendo backup do diretório /etc..."
	   sleep 2
	   tar -P -czvf $HOME/backup/$NOMEBKP.etc.tar.gz /etc
           echo "O backup foi salvo no diretório $HOME/backup"    
	   ;;  
	2) echo "Fazendo backup do diretório /home..."
	   sleep 2	
	   tar -P -czvf $HOME/backup/$NOMEBKP.home.tar.gz /$HOME
           echo "O backup foi salvo no diretório $HOME/backup"
	   ;;   
	3)
 	   echo "Fazendo backup do diretório /var..."
	   sleep 2	
	   tar -P -czvf $HOME/backup/$NOMEBKP.var.tar.gz /var
           echo "O backup foi salvo no diretório $HOME/backup"
	   ;;
        4) 
	   echo "Insira o caminho absoluto do diretório:"
   	   read CAMINHO

#	   while true; do
	       echo "Deseja salvar no diretório padrão $HOME/backup ou informar o caminho manualmente?
        (1) Salvar em $HOME/backup
	(2) Escolher diretório de destino"
	       
	       read ESCOLHA

	       if [ $ESCOLHA -eq 1 ];
	       then
	           echo "O backup será salvo em $HOME/backup..."
		   sleep 2
		   tar -czvf $HOME/backup/$NOMEBKP.caminho_personalizado.tar.gz $CAMINHO
	       elif [ $ESCOLHA -eq 2 ];
	       then
		   echo "Onde você quer salvar o backup? Informe o caminho absoluto."
		   echo "Entenda que o diretório precisa existir!"
		   read DESTINO
		   echo "Fazendo backup do diretório $CAMINHO..."
		   sleep 2
		   tar -czvf $DESTINO/$NOMEBKP.caminho_personalizado.tar.gz $CAMINHO
	       else
	           echo "Opção inválida! Tente novamente."
	       fi
#	   done
	   ;;
	 5)
	     echo "Saindo do sistema..."
	     sleep 2
	     exit 0
	   ;;
    esac	    
done
