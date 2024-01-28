tengo una particion montada en /users, tengo 3 usuarios usr01 usr02 usr03 crea el directorio para que ninguno de los usuarios pueda borrar nada de los otros, y que tengan una quota de 1000Mb en el sistema de archivo de tamaño maximo
ChatGPT
Para lograr esto, puedes utilizar las herramientas de cuotas de disco (quota) y establecer los permisos adecuados en el directorio /users. Aquí hay un conjunto de instrucciones para lograrlo:

1. Crear directorios para los usuarios en /users:
bash
Copy code
sudo mkdir /users/usr01
sudo mkdir /users/usr02
sudo mkdir /users/usr03
2. Establecer cuotas de disco para los usuarios:
Asumiendo que estás utilizando el sistema de archivos ext4, primero asegúrate de que el soporte de cuotas esté habilitado en el sistema de archivos. Abre el archivo /etc/fstab y agrega la opción usrquota al montar la partición que contiene /users. Luego, reinicia la máquina o remonta la partición.

bash
Copy code
# Agrega 'usrquota' al final de las opciones de montaje en /etc/fstab
/dev/sdXY  /users  ext4  defaults,usrquota  0  2
3. Reinicia la máquina o remonta la partición:
bash
Copy code
sudo mount -o remount /users
4. Inicializar las cuotas:
bash
Copy code
sudo quotacheck -cug /users
sudo quotaon /users
5. Establecer cuotas para cada usuario:
bash
Copy code
sudo edquota -u usr01
sudo edquota -u usr02
sudo edquota -u usr03
Esto abrirá un editor interactivo. Establece los límites de bloques y archivos según tus necesidades. Por ejemplo, para 1000MB (1GB), establece los valores apropiados.

6. Establecer permisos en el directorio /users:
bash
Copy code
sudo chown root:root /users
sudo chmod 755 /users
Esto asegurará que solo el usuario root pueda modificar el directorio /users.

Ahora, cada usuario tiene su propio directorio en /users y está limitado por cuotas de disco. Asegúrate de ajustar los valores según tus necesidades exactas y el sistema de archivos que estés utilizando.
