# php paigaldusskript
#kontrollime, mitu korda php7.0 korral ok installed
#muutuja sisse:
php=$(dpkg-query -W -f='${status}' php7.0 2>/dev/null | grep -c 'ok installed')
¤ kui php muutuja väärtus võrdub 0-ga
if [ $php -eq 0 ]; then
 #0 võrdub null tähendab et php ei ole installitud
 #ehk paigaldame teenuse
 echo "paigaldame php ja vajalikud lisad"
 apt install php
 echo "php on paigaldatud"
#kui väärtus võrdub 1 siis tähendab et php on juba installitud
elif [ $php -eq 1 ]; then
 echo "php on juba paigaldatud"
 #kontroll
 which php
#lõpetame tingimuslause then?
fi
#skripti lõpp
