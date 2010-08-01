#!/bin/bash 
#arquivo que faz atualização do site. 
#autor: tadeu
#email: anestesya@gmail.com

HOST='roteiroceara.com.br'
USER='roteiroceara'
PASS=''
TABELA="roteiroceara2"

echo "Inicilizando Atualização...."
echo -e ""
echo -e ""

 cd /home/roteiroceara/public/
 pwd

   echo -e ""
   echo -e "atualizando banco de dados......"
   echo -e "digite a senha para sua conta no servidor web"
   `ssh $USER@$HOST 'mysqldump -u roteiroceara -h hname.roteiroceara.uol.com.br -pfortalCEARA roteiroceara2 > /home/roteiroceara/roteiroceara2.sql'`
   
   echo -e ""
   echo -e "transferindo banco.... roteiroceara.uol.com.br"
    mkdir sql 
    rm -f sql/*  
   echo -e "digite a senha para sua conta no servidor web"
    scp $USER@$HOST:/home/roteiroceara/roteiroceara2.sql sql/
   
   ##testa para saber se o arquivo existe.
   if [ /home/roteiroceara/public/sql/roteiroceara2.sql ];
    then
   	`mysql -u roteiroceara -h 127.0.0.1 -pfortalCEARA roteiroceara2 < ./sql/roteiroceara2.sql`
   else 
     echo "arquivo de backup do banco de dados nao foi encontrado."
     exit 1
   fi
    

   echo -e ""
   echo -e ""
   echo -e "Resetando senha do admin vis Mysql"
	rm -f sql/rst.sql
	echo "select id, user_login, user_pass from wp_users;" > sql/rst.sql
	echo "update wp_users set user_pass=\"\$P\$BOoE17ekilaNzcXm.w9RLIHYdVLxOH0\" where id=1;" >> sql/rst.sql
	echo "select id, user_login, user_pass from wp_users;" >> sql/rst.sql
          if [ /home/roteiroceara/public/sql/rst.sql ]; 
	    then
              mysql -u roteiroceara -pfortalCEARA --database roteiroceara2 < sql/rst.sql
          else
              echo -e "Arquivo de rst.sql nao foi encontrado!"
          fi

   echo -e ""
   echo -e ""
   echo -e "transferindo conteúdo: wp-content/ ......"
      scp -r $USER@$HOST:/home/roteiroceara/roteiroceara.uol.com.br/wp-content .
      echo -e "Removendo erros de PHP5 (<? <?php) &&  <?=\$imagem[0]->imageURL;?> por <?php echo \$imagem[0]->titulo; ?>"
      find ./wp-content/themes/rotce2009/ -name '*.php' | xargs sed -i -e 's/<?/<?php /g' -i -e 's/<?[php\ ]*/<?php /g'

     find . -name '*.php' | xargs sed -i 's/<?=/<?php echo\ /g'
     
   
   echo -e ""
   echo -e ""
   echo "Desativando plugins. ....."
      mv /home/roteiroceara/public/wp-content/plugins/advanced-category-excluder /home/roteiroceara/public/wp-content/plugins/advanced-category-exclude-old
      chmod 777 wp-content/
    
      echo -e "Acesse o painel na seção de plugins e tecle ENTER"
      read
      echo -e "Ative o plugin so WP SUPER CACHE"
      chmod 755 wp-content/

      echo -e "Faça o teste do AB na página home, para saber se o cache está funcioinando."
      
     echo -e "Feito isso altere o rewrite do NGINX"
     echo -e "Reinicie o servidor."
     echo -e "Confira todas as páginas internas!"
     echo -e ""
  
    echo -e "Se deu tudo certo, abra uma lata de cerveja e seja feliz! =D "
    echo -e "Fim da Atualização!"
