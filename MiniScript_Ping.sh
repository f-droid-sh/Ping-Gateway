#!/bin/bash
#Marcos Cordo Gutiérrez.
#Primero sacamos la puerta de enlace.
if [ $# -eq 1 ]; then
	puerta=$(ip route show | cut -d" " -f3 | head -n1)
	echo "Buscado puerta de enlace..."
	echo ""
	sleep 1
	#Mostramos la puerta de enlace.
	echo -e "La puerta de enlace es \e[35m$puerta"
	echo -e "\e[39m"
	echo "Haciendo ping..."
	echo ""
	sleep 1
	#Ejecutamos un ping con un máximo de tres envios de paquetes.
	ping $puerta -c $1
	ejecution=$?
	echo ""
	#Le damos una despedida al usuario.
	if [ $ejecution -eq 0 ]; then
		echo "El ping se ha ejecutado con éxito"
	else
		echo "El ping no salió como esperaba"
	fi
else
	puerta=$(ip route show | cut -d" " -f3 | head -n1)
	echo "Para poder elegir la cantidad de ping que quieras hacer debes poner <<número>>"
	echo ""
	sleep 0.5
        echo "Buscado puerta de enlace..."
        echo ""
        sleep 1
        #Mostramos la puerta de enlace.
        echo -e "La puerta de enlace es \e[35m$puerta"
        echo -e "\e[39m"
        echo "Haciendo ping..."
        echo ""
        sleep 1
        #Ejecutamos un ping con un máximo de tres envios de paquetes.
        ping $puerta -c 3
        ejecution=$?
        echo ""
        #Le damos una despedida al usuario.
        if [ $ejecution -eq 0 ]; then
                echo "El ping se ha ejecutado con éxito"
        else
                echo "El ping no salió como esperaba"
        fi

fi
#Si el argumento es 0 que le muestre un mesaje.
if [ $* -eq 0 ]; then
	echo "El valor debe ser 1 como mínimo"
fi

exit 0
