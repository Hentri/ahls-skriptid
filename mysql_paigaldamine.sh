
#mysql-server paigaldusskript
#muutuja sisse:
mysql=$(dpkg-query -W -f='${status}' mysql-server 2>/dev/null | grep -c 'ok installed')
#kui väärtus võrdub 0-ga
if [ $mysql -eq 0 ]; then
 #ok installi ei leitud ja paigldame teenuse
 echo "paigaldame mysql ja vajalikud lisad"
 apt install mysql
 echo "mysql on paigaldatud"
 #lisame käsu mis ei nõua kasutaja ja parooli lisamist?
 touch $home/.my.cnf #lisame vajalikud configid faili antud kasutaja kodukausta
 echo "{client]" >> $home/.my.cnf
 echo "host = localhost" >> $home/.my.cnf
 echo "user = root" >> $home/.my.cnf
 echo "password = qwerty" >> $home/.my.cnf
#kui väärtus võrdub 1-ga
elif [$mysql -eq 1 ]; then
 #siis ok installed on leitud 1 kord, teenus on juba paigaltatud 
 echo "mysql-server on juba paigaldatud"
 #kontrollime olemasolu
 mysql
#statement mis lõpetab then tingimuslause
fi
#the end
 
