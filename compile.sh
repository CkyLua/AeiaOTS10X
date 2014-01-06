#check if root
if [[ $EUID -ne 0 ]]; then
	echo "You must be root to use this script, press enter to exit."
	read end
	exit 1
else

#OS check
#install libs and stuff
	echo "Chose your Operating System. {Supported OS: Debian, Ubuntu, Fedora, CentOS, FreeBSD} "
	read ans1 
	
#installing here
	if [ $ans1 = "Fedora" ] || [ $ans1 = "CentOS" ]; then

		echo -n "[$ans1]Do you want to install all Dependencies and Tools needed?[y/n] "
		read ans1_1
		if [ $ans1_1 = "y" ]; then
			yum install git cmake gcc-c++ boost-devel gmp-devel community-mysql-devel lua-devel
		fi
		echo "Continuing..."

	else	if [ $ans1 = "Debian" ] || [ $ans1 = "Ubuntu" ]; then

			echo -n "[$ans1]Do you want to install all Dependencies and Tools needed?[y/n] "
			read ans1_1
			if [ $ans1_1 = "y" ]; then
				apt-get install git cmake build-essential liblua5.2-dev libgmp3-dev libmysqlclient-dev libboost-system-dev
				
				echo "Libraries and Build Tools... Installed"
			fi
			echo "Continuing..."
	
	else	if [ $ans1 = "FreeBSD" ]; then
		
		echo -n "[$ans1]Do you want to install all Dependencies and Tools needed?[y/n] "
		read ans1_1
		if [ $ans1_1 = "y" ]; then
			cd /usr/ports/shells/bash && make install clean BATCH=yes
			cd /usr/ports/devel/git && make install clean BATCH=yes
			cd /usr/ports/devel/cmake && make install clean BATCH=yes
			cd /usr/ports/lang/gcc47 && make install clean BATCH=yes
			cd /usr/ports/lang/luajit && make install clean BATCH=yes
			cd /usr/ports/devel/boost-libs && make install clean BATCH=yes
			cd /usr/ports/math/gmp && make install clean BATCH=yes
			cd /usr/ports/databases/mysql-connector-c && make install clean BATCH=yes
			
			echo "Libraries and Build Tools... Installed"
		fi
		
	else	if [ $ans1_1 = "n" ]; then
				echo "Continuing..."
			fi
		
		#else
		#	echo ["Error: Can not Install Dependencies, this may be caused due to mistyping the OS name(OS name is case-sensitive) or that the OS is not supported."]
		
		
	fi
	
#actual compile starts here

		echo -n "FreeBSD? (y/n) "
		read ans4
		if [ $ans4 = "y" ]; then
			echo "Building in FreeBSD."
				mkdir build && cd build
				CXX=g++47 cmake ..
				make
			else 
				echo "Building on something else."
				mkdir build && cd build
				cmake ..
				make
		fi

		echo -n "Do you wish to clean up the server folder?[y/n] "
		read ans5
		if [ $ans5 = "y" ]; then
			mkdir src && mkdir objs

			mv *.cpp *.h src/ && mv *.o objs/
			echo "There might be a few leftovers."
			#There are a few more files that are needed to be moved.
		fi
		echo -n "Done, press [ENTER]."
		read finish

		exit 0
		
		fi
	fi
fi
