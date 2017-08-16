# Basic Fedora Setup
sudo dnf -y update
sudo rpm -Uvh http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo rpm -Uvh http://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo rpm -Uvh https://www.folkswithhats.org/repo/$(rpm -E %fedora)/RPMS/noarch/folkswithhats-release-2.0.0-0.fc$(rpm -E %fedora).noarch.rpm
sudo dnf copr enable rabiny/albert
sudo dnf -y install albert
sudo dnf group install "C Development Tools and Libraries"
sudo dnf -y install fedy
sudo dnf -y install tlp tlp-rdw
sudo systemctl enable tlp
sudo dnf -y install steam
sudo dnf -y install vlc
sudo dnf -y install dropbox nautilus-dropbox
sudo dnf -y install nano vim rpm-build
sudo dnf -y install postgresql-server postgresql-contrib memcached redis
sudo systemctl enable postgresql
sudo postgresql-setup --initdb --unit postgresql
sudo sed -i.bak 's/ident/trust/' /var/lib/pgsql/data/pg_hba.conf # NEVER do this in production servers
sudo dnf -y install phpPgAdmin pgadmin3
#sudo systemctl start postgresql
#sudo su - postgres
#createuser gazbit -p
#createdb gazbit --owner=gazbit
# opera screen terminator youtube-dl ranger mc npm
# Gimp and a 'photoshop' skin
sudo dnf -y install gimp
sh -c "$(curl -fsSL https://raw.githubusercontent.com/doctormo/GimpPs/master/tools/install.sh)"
# I should probably copy that gist somewhere
# Spotify
# sudo dnf config-manager --add-repo=http://negativo17.org/repos/fedora-spotify.repo
# sudo dnf -y install spotify-client
# Twitter
sudo dnf -y install corebird
sudo dnf -y install docker docker-compose
# Latest java web browser plugins
sudo dnf -y install icedtea-web
# A few terminals
sudo dnf copr enable heikoada/terminix
sudo dnf -y install terminix terminator
# Gnome Tweak tools
sudo dnf -y install gnome-tweak-tool


# Make Gnome titlebars less 'fat'
tee ~/.config/gtk-3.0/gtk.css <<-EOF
.header-bar.default-decoration {
 padding-top: 3px;
 padding-bottom: 3px;
 font-size: 0.8em;
}

.header-bar.default-decoration .button.titlebutton {
 padding: 0px;
}
EOF

# Terminator Config
touch ~/.config/terminator/config
tee ~/.config/terminator/config <<-EOF
[global_config]
  title_transmit_bg_color = "#d30102"
  focus = system
[keybindings]
[layouts]
  [[default]]
    [[[child1]]]
      parent = window0
      type = Terminal
      profile = default
    [[[window0]]]
      parent = ""
      type = Window
[plugins]
[profiles]
  [[default]]
    use_system_font = false
    font = Hack 12
    scrollback_lines = 2000
    palette = "#073642:#dc322f:#859900:#b58900:#268bd2:#d33682:#2aa198:#eee8d5:#586e75:#cb4b16:#586e75:#657b83:#839496:#6c71c4:#93a1a1:#fdf6e3"
    foreground_color = "#eee8d5"
    background_color = "#002b36"
    cursor_color = "#eee8d5"
EOF

# zsh Setup
cd ~
curl https://raw.githubusercontent.com/scopatz/nanorc/master/install.sh | sh
wget https://raw.githubusercontent.com/Gazaunga/i3/master/.zshrc
mkdir zsh
cd zsh
wget https://raw.githubusercontent.com/Gazaunga/i3/master/zsh/minimal.zsh

# git Setup
git config --global user.name "Gazaunga"
git config --global user.email "jeremy.ottley@gmail.com"
git config --global core.autocrlf input
git config --global core.safecrlf true

# Font Setup
cd ~
mkdir .fonts
cd .fonts
wget http://int10h.org/oldschool-pc-fonts/download/ultimate_oldschool_pc_font_pack_v1.0.zip
unzip ultimate_oldschool_pc_font_pack_v1.0.zip
git clone https://github.com/tonsky/FiraCode.git
git clone https://github.com/sunaku/tamzen-font.git
git clone https://github.com/FortAwesome/Font-Awesome.git
git clone https://github.com/adobe-fonts/source-code-pro.git
cd source-code-pro
sh build.sh
sudo fc-cache -v

# SpaceVim
cd ~
curl -sLf https://spacevim.org/install.sh | bash

# Set some good defaults for GNOME applications without
# resorting to gnome-settings-daemon and other deps.

## THESE NEED TO BE TRANSLATED TO "GSETTINGS" COMMANDS##
# stop opening each dir in its own window
#gconftool-2 --type boolean --set /apps/nautilus/preferences/always_use_browser true

# details view
#gconftool-2 --type string --set /apps/nautilus/preferences/default_folder_viewer list_view

# desktop points to ~
#gconftool-2 --type boolean --set /apps/nautilus/preferences/desktop_is_home_dir true

# allow bypassing of trash bin
#gconftool-2 --type boolean --set /apps/nautilus/preferences/enable_delete true

# disable the nautilus desktop
#gconftool-2 --type boolean --set /apps/nautilus/preferences/show_desktop false

# open URLs in app defined by x-www-browser and not GNOME Preferred Applications
#gconftool-2 --type string --set /desktop/gnome/url-handlers/http/command "x-www-browser %s"


# flatpak
#sudo dnf install -y flatpak flatpak-libs
#sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Firefox addons:
# Hide Caption Titlebar Plus
# GNOME Theme (Tweak?)
# HTTPS Everywhere
# gTranslate
# Self Destructing Cookies
# uBlock Origin
# Privacy Badger

# Gnome Extensions
# OpenWeather
# TopIcons Plus
# Axe Menu
# Extend Panel Menu
# Dash to Panel

# ruby install
cd ~
wget -O ruby-install-0.6.1.tar.gz https://github.com/postmodern/ruby-install/archive/v0.6.1.tar.gz
tar -xzvf ruby-install-0.6.1.tar.gz
cd ruby-install-0.6.1/
sudo make install

# check to see if it isntalled successfully
ruby-install -v

# install ruby
ruby-install --system --latest ruby
ruby-install jruby

# Latest stable Ruby with RVM
#sudo dnf -y install patch autoconf gcc-c++ patch libffi-devel automake libtool bison sqlite-devel ImageMagick-devel nodejs git gitg
#curl -sSL https://rvm.io/mpapis.asc | gpg2 --import
#curl -L https://get.rvm.io | bash -s stable --ruby
#sudo npm -g install brunch phantomjs
