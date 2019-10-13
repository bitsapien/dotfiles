PROJECTS_DIRECTORY="/Volumes/gitdisk"
DOTFILES_DIRECTORY="$PROJECTS_DIRECTORY/projects/dotfiles"
SSH_KEY_PATH="$HOME/.ssh/bitsapien"

cd $HOME

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
mkdir "$PROJECTS_DIRECTORY/projects"
git_clone dotfiles git@github.com:bitsapien/dotfiles.git $DOTFILES_DIRECTORY

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
# install powerline10k
git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
echo "ZSH_THEME=\"powerlevel10k/powerlevel10k\"" >> $HOME/.zshrc
SOURCE_CODE_PRO_FOR_POWERLINE="https://github.com/powerline/fonts/blob/master/SourceCodePro/Source%20Code%20Pro%20for%20Powerline.otf?raw=true"
open $SOURCE_CODE_PRO_FOR_POWERLINE
# install auto-suggestions
echo "source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh" >> $HOME/.zshrc
echo "source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> $HOME/.zshrc
echo "Change font in iTerm 2 > Preferences > Profiles > Text"
echo "To enable word jumps: iTerm → Preferences → Profiles → Keys → Load Preset... → Natural Text Editing → Boom! Head explodes"

# Add custom commands to zshrc
echo "export DOTFILES=$DOTFILES_DIRECTORY" >> $HOME/.zshrc
source $HOME/.zshrc

# Install packages using Brew
brew bundle --file=$PROJECTS_DIRECTORY/projects/dotfiles/brew/Brewfile -v

# setting up vim
ln -s $PROJECTS_DIRECTORY/projects/dotfiles/vim/.vimrc
# Installing Pathogen
mkdir -p $HOME/.vim/autoload $HOME/.vim/bundle && \
  curl -LSso $HOME/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim


IFS=$'\n' read -d '' -r  paths < $DOTFILES_DIRECTORY/vim/Pathogenfile

pushd $HOME/.vim/bundle
  cat $DOTFILES_DIRECTORY/vim/Pathogenfile | xargs git clone
popd
