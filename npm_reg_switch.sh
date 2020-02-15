#!/bin/sh
echo "Switching registry..."
NPM_TAOBAO_REG="https://registry.npm.taobao.org/"
NPM_SOURCE_REG="https://registry.npmjs.org/"
NPM_CURRENT_REG=`npm config get registry`
# YARN_SOURCE_REG="https://registry.yarnpkg.com"
# YARN_CURRENT_REG=`yarn config get registry`

if [ $NPM_CURRENT_REG == $NPM_SOURCE_REG ]
then 
	echo "Current is NPM registry."

	read -r -p "Do you want to switch to Taobao NPM registry? [Y/n]" input

	case $input in 
		[yY][eE][sS]|[yY])
			echo "Already swith NPM registry to Taobao"
			`npm config set registry $NPM_TAOBAO_REG`
			
			# `yarn config set registry $NPM_TAOBAO_REG`
			;;

		[nN][oO]|[nN])
			exit 1
			;;

		*)
			echo "Invalid input..."
			exit 1
			;;
	esac

elif [ $NPM_CURRENT_REG == $NPM_TAOBAO_REG ]
then
	echo "Current is Taobao registry."

	read -r -p "Do you want to switch to offcial NPM registry? [Y/n]" input

	case $input in 
		[yY][eE][sS]|[yY])
			echo "Already swith NPM registry to offcial."
			`npm config set registry $NPM_SOURCE_REG`
			# `yarn config set registry $YARN_SOURCE_REG`
			;;

		[nN][oO]|[nN])
			exit 1
			;;

		*)
			echo "Invalid input..."
			exit 1
			;;
	esac
fi
