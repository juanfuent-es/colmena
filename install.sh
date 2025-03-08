#!/bin/bash

#===================================================#
# 				CMS in RoR WEBAPP 		  			#
#		 	  Script de instalación		  			#
#---------------------------------------------------#
#		Escrito por Juan Fuentes el 19/07/2020		#
#	    	Actualizado el 23/03/2023       		#
#===================================================#

#===================================================#
#		  	NO EDITAR FUERA DE LINUX	  			#	
#---------------------------------------------------#
# En caso de edición fuera de linux, es probable no #
# pueda ejecutarse el script por el formato, en 	#
# este caso deberemos de volver a encodear con el 	#
# paquete dos2unix y posteriormente convertirlo:	#
#													#
# sudo apt-get install dos2unix   					#
# dos2unix install.sh			  					#
# sudo chmod +x install.sh			  				#
#===================================================#


#---------------------------------------------------#
# INSTALACIÓN DE RUBY 								#
# @docs: https://www.ruby-lang.org/en/documentation/installation/
# @return: Lenguaje en que se programo el sitio
#---------------------------------------------------#
# Crear folder para instalación y acceder al mismo 	#
#!/bin/bash

# Dependencias de sistema
sudo apt update

# Dependencias de Ruby on Rails
sudo apt-get install build-essential libssl-dev libyaml-dev libreadline-dev openssl curl software-properties-common libffi-dev git-core zlib1g-dev bison libxml2-dev libxslt1-dev libcurl4-openssl-dev libsqlite3-dev sqlite3 -y

#---------------------------------------------------#
#       INSTALACIÓN DE RUBY con rbenv						  #
#---------------------------------------------------#
#
sudo apt install rbenv
rbenv install 3.1.2
rbenv global 3.1.2
sudo apt-get install ruby-dev
gem install bundler

#---------------------------------------------------#
# INSTALACIÓN DE APACHE								#
# @docs: https://help.ubuntu.com/lts/serverguide/httpd.html
sudo apt-get install apache2 -y
sudo apt install apache2

#---------------------------------------------------
# INSTALACIÓN DE PASSENGER							
# @docs: https://www.phusionpassenger.com/library/	
# @see: https://www.phusionpassenger.com/docs/advanced_guides/install_and_upgrade/apache/install/oss/focal.html
#---------------------------------------------------
# Instalamos el paquete
# Install our PGP key and add HTTPS support for APT
sudo apt-get install -y dirmngr gnupg apt-transport-https ca-certificates curl

curl https://oss-binaries.phusionpassenger.com/auto-software-signing-gpg-key.txt | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/phusion.gpg >/dev/null

# Add our APT repository
sudo sh -c 'echo deb https://oss-binaries.phusionpassenger.com/apt/passenger noble main > /etc/apt/sources.list.d/passenger.list'
sudo apt-get update

# Install Passenger + Apache module
sudo apt-get install -y libapache2-mod-passenger
# Actualizamos sistema
sudo apt-get update
# Activamos el módulo ´mod-passenger´
sudo a2enmod passenger
# Reiniciamos apache para poder ocupar passenger
sudo apache2ctl restart
#---------------------------------------------------#
# INSTALACIÓN DE IMAGEMAGICK						
# @docs: http://www.imagemagick.org/				
# @return: Procesamiento de imágenes				
#---------------------------------------------------#
sudo apt-get install imagemagick -y
sudo apt-get install libmagickwand-dev -y
sudo apt-get install libjpeg-dev libpng-dev libtiff-dev libwebp-dev -y
sudo apt-get install jpegoptim

#---------------------------------------------------#
# INSTALACIÓN DE POSTGRESQL
#---------------------------------------------------#
sudo apt update
sudo apt install postgresql postgresql-contrib libpq-dev -y
sudo systemctl status postgresql
sudo systemctl start postgresql

# node
# Download and install nvm:
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
# in lieu of restarting the shell
\. "$HOME/.nvm/nvm.sh"
# Download and install Node.js:
nvm install 22
# Verify the Node.js version:
node -v # Should print "v22.14.0".
nvm current # Should print "v22.14.0".
# Descarga e instala Yarn:
corepack enable yarn
# Verifica la versión de Yarn:
yarn -v

# update
sudo apt-get update && sudo apt-get upgrade -y

sudo a2enmod headers
sudo service apache2 restart
sudo a2enmod mod_headers
sudo a2enmod expires