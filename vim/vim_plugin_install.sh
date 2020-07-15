#! /bin/bash

vim_plugin_install() {
  git clone git://github.com/$1/$2.git ~/.vim/bundle/$2
}
