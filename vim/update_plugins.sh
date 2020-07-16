for dirs in $HOME/.vim/bundle/*; do pushd $dirs;git pull origin &;popd; done
