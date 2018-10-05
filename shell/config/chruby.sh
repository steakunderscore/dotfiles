# Install chruby and ruby-install
# echo 2.5.1 > ~/.ruby-version
# gem install bundler pry awesome_print git-up hitch gem-browse gem-ctags

CHRUBY_PATH=/usr/share/chruby
if [ -d "$CHRUBY_PATH" ]; then
  source "$CHRUBY_PATH/chruby.sh"
  source "$CHRUBY_PATH/auto.sh"
fi

export BUNDLE_JOBS=4
