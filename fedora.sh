# dnf flags
echo 'max_parallel_downloads=10' | sudo tee -a /etc/dnf/dnf.conf
echo 'deltarpm=true' | sudo tee -a /etc/dnf/dnf.conf

# packages
sudo dnf install g++ feh neofetch nodejs clang-tools-extra htop curl radare2-devel neovim mingw64-gcc flatpak flameshot blueman pasystray sqlite kitty keepassxc python3-pip xclip -y -y -y

# flatpak repos
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak update -y 

# rpm fusion repos
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-"$(rpm -E %fedora)".noarch.rpm -y
sudo dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-"$(rpm -E %fedora)".noarch.rpm -y

# install codecs & drivers
sudo dnf install mpv akmod-nvidia -y -y
sudo dnf update -y 

# reboot to load proprietary nvidia drivers 
reboot
