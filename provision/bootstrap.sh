#!/usr/bin/env bash
#
# install these as vagrant


echo 'installing rbenv'
if [ ! -d ~/.rbenv ]; then
  git clone https://github.com/rbenv/rbenv.git /home/vagrant/.rbenv
  echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> /home/vagrant/.bashrc
  echo 'eval "$(rbenv init -)"' >> /home/vagrant/.bashrc
fi

if [ ! -d ~/.rbenv/plugins/ruby-build ]; then
  git clone https://github.com/rbenv/ruby-build.git /home/vagrant/.rbenv/plugins/ruby-build
  echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> /home/vagrant/.bashrc
fi

export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"
eval "$(rbenv init -)"

rbenv install 2.6.5
rbenv global 2.6.5
rbenv rehash

echo installing current RubyGems
gem update --system -N >/dev/null 2>&1

echo installing Bundler
gem install bundler -N >/dev/null 2>&1

echo installing heroku
curl --silent --show-error https://cli-assets.heroku.com/install.sh | sh >/dev/null 2>&1

echo installing git autocomplete
curl -L --silent https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash >> /home/vagrant/.git-completion.bash
cat >> /home/vagrant/.bashrc << EOT

EOT