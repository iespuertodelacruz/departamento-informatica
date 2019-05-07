#!/bin/bash

function add_repos {
  echo "[INFO] Actualizando repositorios"
  cp virtualbox.repo /etc/zypp/repos.d
  wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | rpm --import -

  cp visualcode.repo /etc/zypp/repos.d
  rpm --import https://packages.microsoft.com/keys/microsoft.asc

  sh -c 'echo -e "[Atom]\nname=Atom Editor\nbaseurl=https://packagecloud.io/AtomEditor/atom/el/7/\$basearch\nenabled=1\ntype=rpm-md\ngpgcheck=0\nrepo_gpgcheck=1\ngpgkey=https://packagecloud.io/AtomEditor/atom/gpgkey" > /etc/zypp/repos.d/atom.repo'
  zypper --gpg-auto-import-keys refresh

  #zypper addrepo https://download.opensuse.org/repositories/Education/openSUSE_Tumbleweed/Education.repo

  zypper refresh
}

function install_tic {
  echo "[INFO] Desktop..."
  zypper install -y patterns-mate-mate

  echo "[INFO] Informática..."
  zypper install -y vim tree geany fd
  zypper install -y xournal evince
  zypper install -y chromium midori wireshark
  zypper install -y nmap traceroute ipcalc hexchat
  zypper install -y gcc make kernel-devel
  zypper install -y code atom
  zypper install -y sqlite3 ruby2.5-rubygem-sqlite3
  zypper install -y docker 
  #zypper install -y gns3-gui gns3-server
  #zypper install -y vagrant  
  zypper install -y automake gdbm-devel libffi-devel libyaml-devel libopenssl-devel ncurses-devel readline-devel zlib-devel sqlite3-devel nodejs8 git
  zypper install -y -t pattern devel_C_C++
  zypper install -y virtualbox
  systemctl disable firewalld
  systemctl stop firewalld
  # Instalar android-studio
  # https://software.opensuse.org/package/android-studio?locale=nn
}

function install_mul {
  echo "[INFO] Multimedia..."
  zypper install -y krita 
  zypper install -y inkscape
  zypper install -y blender
  zypper install -y vlc audacity
  zypper install -y kdenlive
  zypper install -y openshot
  zypper install -y simplescreenrecorder recordmydesktop gtk-recordMyDesktop
  zypper install -y shutter
  zypper install -y q4wine
  zypper install -y fuse-exfat
}

function install_edu {
  echo "[INFO] Educativos..."
  zypper install -y kgeography gnome-maps marble
  zypper install -y chameleon
  #zypper install -y openbabel
  zypper install -y kicad  kicad-doc-es librecad dia
  zypper install -y geogebra octave
  zypper install -y genius kalgebra kmplot mathomatic nasc
  #zypper install -y klogic
  #zypper install -y ngspice spice-gtk spice-up
  zypper install -y libreoffice-writer-extensions
}

zypper refresh
#add_repos
install_tic
#conf_vbox
#install_mul
#install_edu
zypper update

exit 0

function conf_vbox {
  # Virtualbox
  usermod super -G vboxusers
  usermod asir -G vboxusers
  usermod daw -G vboxusers
  #VBoxManage extpack uninstall "Oracle VM VirtualBox Extension Pack"
  #VBoxManage extpack install Oracle_VM_VirtualBox_Extension_Pack-4.3.30-101610.vbox-extpack
  #virtualbox Oracle_VM_VirtualBox_Extension_Pack-*.vbox-extpack &
}

function install_android {
  add-apt-repository -y ppa:webupd8team/java
  add-apt-repository -y ppa:didrocks/ubuntu-developer-tools-center
  add-apt-repository -y ppa:paolorotolo/android-studio

  # Ubuntu-developers-tools-center
  apt-get -y install ubuntu-developer-tools-center
  # Android SDK
  apt-get -y install python-software-properties

  # -- Sistemas de 64 bits
  aptitude install ia32-libs
  apt-get -y install lib32z1 lib32ncurses5 lib32bz2-1.0 lib32stdc++6
  # Android Studio
  apt-get -y install android-studio
}

function conf_italc {
  usermod alumno -G italc
  usermod super -G italc
  #italc 108
  cp key108 /etc/italc/keys/public/teacher/key
  mv /etc/italc/italc.conf /etc/italc/italc.conf.bak
  cp italc.conf /etc/italc/italc.conf
  #italc 109
  #cp key109 /etc/italc/keys/public/teacher/key
  chgrp -R italc /etc/italc/keys/public/

  echo "exec /usr/bin/ica &">>/mnt/asir/home/.profile
  echo "exec /usr/bin/ica &">>/mnt/daw/home/.profile
}

function dudas {
  # Actualizaciones desde archivos descargados.
  libreoffice LanguageTool-3.0.oxt &
  vagrant
}

