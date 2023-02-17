sudo su

# install packages
for package_name in zsh git-core nginx neovim
do 
  apt install -y $package_name
done

# configure CLI

# configure editor

#apt-get install zsh
#apt-get install git-core
#wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
#usermod -u bitsapien -s `which zsh`
#exit
#echo "change .zshrc to st theme `gallois`"
# enjoy
