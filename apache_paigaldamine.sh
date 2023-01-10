#apache paigaldusskript
#muutuja:
APACHE2=$(dpkg-query -W -f='${Status}' apache2 2>/dev/null | grep -c 'ok installed')
# Kui apache2 muutuja väärtus võrdub 0-ga
if [ $APACHE2 -eq 0 ]; then
	echo "Paigaldame apache2"
	apt install apache2
	echo "Apache on paigaldatud"
# Kui apache2 muutuja väärtus võrdub 1-ga
elif [ $APACHE2 -eq 1 ]; then
	echo "apache2 on juba olemas"
	systemctl start apache2
	systemctl status apache2
#lõpetame tingimuslause
fi
# skripti lõpp
