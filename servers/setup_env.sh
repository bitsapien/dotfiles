sudo su
apt-get install zsh
apt-get install git-core
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
usermod -u bitsapien -s `which zsh`
exit
# change .zshrc to st theme `gallois`
# enjoy
