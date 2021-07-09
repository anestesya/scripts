l## Remover o MySql do Homebrew
1 - open terminal
2 - use mysqldump to backup your databases
3 - Check for mysql processo ps aux | grep "mysql"
4 - Stop and Kill proccess
5 - brew remove mysql
    brew cleanup

A ponte dos Guarda-Chuvas. CUsto zero para a prefeitura através do programa Boa Praça. A brandt Brasil, fabricante de fertilizantes fará todo o cuidado de manutenção do local.


6 - Remove Files( dica: para ver no homebrew onde está as configurações de cada versão do MySql procure pelos arquivos homebrew.*.mysql.plist disponíveis em cada versão)

sudo rm /usr/local/mysql
sudo rm -rf /usr/local/var/mysql
sudo rm -rf /usr/local/mysql*
sudo rm ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist
sudo rm -rf /Library/StartupItems/MySQLCOM
sudo rm -rf /Library/PreferencePanes/My*

7 - Unload options Mysql Auto-Login
launchctl unload -w ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist

8 - Remover configurações antigas 

# Edit this file: /etc/hostconfig
# Remove the line MYSQLCOM=-YES-


9 - Remover preferencias antigas
rm -rf ~/Library/PreferencePanes/My*
sudo rm -rf /Library/Receipts/mysql*
sudo rm -rf /Library/Receipts/MySQL*
sudo rm -rf /private/var/db/receipts/*mysql*

10 - Reiniciar o computador.

mysql_install_db --verbose --user=`whoami` --basedir=/usr/local/Cellar/mysql\@5.7/5.7.34 --datadir=/usr/local/var/mysql

105 - 99,99
90 - 

=== 
##Instalar uma nova versão do MySQL
No MacOSX a versão do HighSierra o Mysql é o 5.7, quando usamos o homebrew para instalar outra versão, podemos ter dificuldades ao tentar acessar os comandos e arquivos de configurações de cada um.

1 - procure o arquivo homebrew.*.plist disponível no diretório homebrew da versão do mysql
procure também via comando find e localize pelos arquivos .cnf, my.cnf
find / -name *.cnf 2>/dev/null

o 2>/dev/null no final do comando, indica ao comando find para direcionar as saídas de erros para o limbo ( /dev/null ).

2 - anote os caminhos de configuração usados para a versão que deseja ativar
3 - configure um alias no bash para ajudar você a alterar as versões no PATH
4 - use agora o brew services mysql@versão start/stop para alterar entre versões
5 - ative o path para a versão pelo alias criado em seu bash