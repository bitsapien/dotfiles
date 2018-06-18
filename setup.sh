PROJECTS_DIRECTORY="/Volumes/gitdisk"
SSH_KEY_PATH="$HOME/.ssh/bitsapien"
VIM_COLOR_THEME="solarized"
VIM_COLOR_SOURCE="git://github.com/altercation/vim-colors-solarized.git"
PATHOGEN_CTRLP_NAME="ctrlp.vim"
PATHOGEN_CTRLP="git://github.com/kien/$PATHOGEN_CTRLP_NAME.git"
PATHOGEN_AIRLINE_NAME="vim-airline"
PATHOGEN_AIRLINE="git://github.com/bling/$PATHOGEN_AIRLINE_NAME.git"
PATHOGEN_FZF_NAME="fzf"
PATHOGEN_FZF="git://github.com/junegunn/$PATHOGEN_FZF_NAME.git"
PATHOGEN_POLYGLOT_NAME="vim-polyglot"
PATHOGEN_POLYGLOT="git@github.com:sheerun/vim-polyglot.git"

git_clone() {
 if [ ! -d $1 ]; then
   git clone $2
 fi
}

# Install brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Keys
ssh-add $SSH_KEY_PATH 
# Get dotfiles
cd $PROJECTS_DIRECTORY
mkdir projects 
cd projects
git_clone dotfiles git@github.com:bitsapien/dotfiles.git
cd $HOME

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
# install powerline9k
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
echo "ZSH_THEME=\"powerlevel9k/powerlevel9k\"" >> $HOME/.zshrc
SOURCE_CODE_PRO_FOR_POWERLINE="https://github.com/powerline/fonts/blob/master/SourceCodePro/Source%20Code%20Pro%20for%20Powerline.otf?raw=true"
open $SOURCE_CODE_PRO_FOR_POWERLINE
# install auto-suggestions
brew install zsh-autosuggestions
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
echo "Change font in iTerm 2 > Preferences > Profiles > Text"
source $HOME/.zshrc


# setting up vim
ln -s $PROJECTS_DIRECTORY/projects/dotfiles/vim/.vimrc
# Installing Pathogen
mkdir -p $HOME/.vim/autoload $HOME/.vim/bundle && \
  curl -LSso $HOME/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
cd $HOME/.vim/bundle

git_clone vim-colors-solarized $VIM_COLOR_SOURCE 
git_clone $PATHOGEN_CTRLP_NAME $PATHOGEN_CTRLP
git_clone $PATHOGEN_AIRLINE_NAME $PATHOGEN_AIRLINE
git_clone $PATHOGEN_FZF_NAME $PATHOGEN_FZF
git_clone $PATHOGEN_POLYGLOT_NAME $PATHOGEN_POLYGLOT



brew install the_silver_searcher
brew install moreutils
brew install tree
brew install
