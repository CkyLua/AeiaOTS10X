## Usage instructions:
## git clone https://github.com/otland/forgottenserver
## cd forgottenserver
## bash ncompile.sh
## It is important to run with 'bash' and not 'sh' or as an executable(./file)
## because the script is multiplatform so I did not include the shebang.

## Script by dominique120
## Few edits and fixes by fallen(decltype)
## Idea from the compile.sh script that was packed with some TFS 0.4 revs.
## Made for TFS 1.0
## If you plan of editing try to keep the structure and conventions
## Line enings must be LF only, not CRLF.

## Get CPU core count
## Still testing
cpuCores=$(nproc)
## make processes to be spawned.
coreBuild=$((cpuCores + 1))

## Colors
greenText=$(tput setab 0; tput setaf 2)
redText=$(tput setab 0; tput setaf 1)
blueText=$(tput setab 0; tput setaf 6)
none=$(tput sgr0)
###
### Functions to simplify stuff :)
###

debianDeps() {
	apt-get install git cmake build-essential liblua5.2-dev \
		libgmp3-dev libmysqlclient-dev libboost-system-dev
}

fedoraDeps() {
	yum install git cmake gcc-c++ boost-devel \
		gmp-devel community-mysql-devel lua-devel
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
	echo "Build on $cpuCores threads with $coreBuild processes? (experimental but loads faster) y or n "
		read ans1_4
			if [[ $ans1_4 = "y" ]]; then
				echo -e $greenText"Building on $cpuCores threads with $coreBuild processes."$none
				make -j $coreBuild
			elif [[ $ans1_4 = "n" ]]; then
				echo -e $blueText"Building on a single thread."$none
				make
			else
				echo "answer y or n"
				echo -e $redText"Answer y or n"$none
			fi
}	

genBuild() {
	echo "Building..."
	mkdir build && cd build
	cmake ..
		echo "Build on $cpuCores threads with $coreBuild processes? (experimental but loads faster) y or n "
		read ans1_4
			if [[ $ans1_4 = "y" ]]; then
				echo -e $greenText"Building on $cpuCores threads with $coreBuild processes."$none
				make -j $coreBuild
			elif [[ $ans1_4 = "n" ]]; then
				echo -e $blueText"Building on a single thread."$none
				make
			else
				echo -e $redText"Answer y or n"$none
			fi				
}
# Unused clean, I'm leaving it here in case we might need it in the future.
clean() {
	mkdir objs/
	mv *.o objs/
	echo "There might be a few leftover files."
}

###
### Script starts here
###

#check if root
if [[ $EUID -ne 0 ]]; then
	echo "You must be root to use this script, press enter to exit."
	read end
	exit 1
fi
#OS dependencies and other stuff
echo "Chose your Operating System. {Supported OS: Debian, Ubuntu, Fedora, CentOS, FreeBSD, Scientific Linux} "
read ans1 
			
if [[ $ans1 = "Fedora" ]] || [[ $ans1 = "CentOS" ]] || [[ $ans1 = "Scientific Linux" ]]; then
	echo -n "Should the script install dependencies? y or n"
	read ans1_1
	if [[ $ans1_1 = "y" ]]; then
		fedoraDeps
	elif [[ $ans1_1 = "n" ]]; then
		break
	else
		echo "Answer 'y' or 'n' "
	fi
elif [[ $ans1 = "Debian" ]] || [[ $ans1 = "Ubuntu" ]]; then
	echo -n "Should the script install dependencies? y or n"
	read ans1_1
	if [[ $ans1_1 = "y" ]]; then
		debianDeps
	elif [[ $ans1_1 = "n" ]]; then
		break
	else
		echo "Answer 'y' or 'n' "
	fi
elif [[ $ans1 = "FreeBSD" ]]; then
	echo -n "Should the script install dependencies? y or n"
	read ans1_1
		if [[ $ans1_1 = "y" ]]; then
			bsdDeps
		elif [[ $ans1_1 = "n" ]]; then
			break
		else
			echo "Answer 'y' or 'n' "
		fi				
		else
			echo "Pick a valid OS"		
		fi
		
#Compiling here

echo -n "Are we on FreeBSD? y or n"
read ans1_2
	if [[ $ans1_2 = "y" ]]; then
		bsdbuild
	elif [[ $ans1_2 = "n" ]]; then
		genBuild
	else
		echo "Answer y or n"
	fi

