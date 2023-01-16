# phpmyadmin paigaldusskript
# muutuja sisse:
PMA=$(dpkg-query -W -f='${status}' phpmyadmin 2>/dev/null | grep -c 'ok installed')
# kui PMA muutuja väärtus võrdub 0-ga
if [ $PMA -eq 0 ]; then
	# siis ok installed ei ole leitud
	# ja väljastame vastava teate ning
	# paigaldame teenuse
	echo "Paigaldame phpmyadmin ja vajalikud lisad"
	apt install phpmyadmin
	echo "phpmyadmin on paigaldatud"
# kui PMA muutuja väärtus võrdub 1-ga
elif [ $PMA -eq 1 ]; then
	# siis ok installed on leitud 1 kord
	# ja teenus on juba paigaldatud
	echo "phpmyadmin on juba paigaldatud"
	# kontrollime olemasolu
	phpmyadmin
# lõpeatme tingimuslause
fi
# skripti lõpp
