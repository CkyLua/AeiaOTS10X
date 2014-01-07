###
### Functions to simplify stuff :)
###
debianDeps() {
apt-get install git cmake build-essential liblua5.2-dev libgmp3-dev libmysqlclient-dev libboost-system-dev
}	
fedoraDeps() {
yum install git cmake gcc-c++ boost-devel gmp-devel community-mysql-devel lua-devel
}	
bsdDeps() {
	cd /usr/ports/shells/bash && make install clean BATCH=yes
	cd /usr/ports/devel/git && make install clean BATCH=yes
	cd /usr/ports/devel/cmake && make install clean BATCH=yes
	cd /usr/ports/lang/gcc47 && make install clean BATCH=yes
	cd /usr/ports/lang/luajit && make install clean BATCH=yes
	cd /usr/ports/devel/boost-libs && make install clean BATCH=yes
	cd /usr/ports/math/gmp && make install clean BATCH=yes
	cd /usr/ports/databases/mysql-connector-c && make install clean BATCH=yes
}
libInstall() {
	echo "Libraries and Build Tools... Installed"
}
bsdBuild() {
	echo "Building on FreeBSD"
	mkdir build && cd build
	CXX=g++47 cmake ..
	make
}	
genBuild() {
	echo "Building..."
	mkdir build && cd build
	cmake ..
	make
}
clean() {
	mv *.cpp *.h src/ && mv *.o objs/
	echo "There might be a few leftover files."
}
###
### Script starts here
###
if [[ $EUID -ne 0 ]]; then
	echo "You must be root to use this script, press enter to exit."
	read end
	exit 1

		echo "Chose your Operating System. {Supported OS: Debian, Ubuntu, Fedora, CentOS, FreeBSD} "
			read ans1 
			
				if [[ $ans1 = "Fedora" ]] || [[ $nas1 = "CentOS" ]]; then
					echo -n "Should the script install dependencies? y/n"
						if [[ $ans1_1 = "y" ]]; then
							fedoraDeps
						elif [[ $ans1_1 = "n" ]]; then
							break
						else
							echo "Answer '\y\' or \'n\' "
						fi
				elif [[ $ans1 = "Debian" ]] || [[ $ans1 = "Ubuntu" ]]; then
					echo -n "Should the script install dependencies? y/n"
						if [[ $ans1_1 = "y" ]]; then
							debianDeps
						elif [[ $ans1_1 = "n" ]]; then
							break
						else
							echo "Answer '\y\' or \'n\' "
						fi
				elif [[ $ans1 = "FreeBSD" ]]; then
					echo -n "Should the script install dependencies? y/n"
						if [[ $ans1_1 = "y" ]; then
							bsdDeps
						elif [[ $ans1_1 = "n" ]]; then
							break
						else
							echo "Answer '\y\' or \'n\' "
						fi
						
				else
					echo "Pick a valid OS"
					
				fi
				## temporary fi
				fi
				
	
	
