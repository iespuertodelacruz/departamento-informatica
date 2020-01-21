#!/usr/bin/env ruby
# Instalar el software en un equipo OpenSUSE
#

def tic
  # java-11-openjdk java-11-openjdk-devel
  names = w%[
    geany git kernel-devel make gcc
    audacity unetbootin vlc
    shutter simplescreenrecorder
    kndenlive openshot shotcut
    inkscape calligra-krita kolourpaint
    dia yotutube-dl
    filezilla hexchat gns3 nmap tree wireshark
    docker ruby-devel vagrant
    godot fetchmsttfonts

    vim tree fd
    xournal evince
    chromium midori
    traceroute ipcalc hexchat
    code atom
    sqlite3 sqlite3-devel ruby2.5-rubygem-sqlite3
    gns3
    automake gdbm-devel libffi-devel libyaml-devel
    libopenssl-devel ncurses-devel readline-devel
    zlib-devel  nodejs8 virtualbox
  ]
  return names.sort
end

def tic
  return names.flatten.sort
end

def mul
  names = %w[ krita inkscape blender vlc audacity
    kdenlive openshot shutter
    simplescreenrecorder recordmydesktop gtk-recordMyDesktop
    q4wine fuse-exfat
  ]
  return names.sort
end

def edu
  names = %w[ kgeography gnome-maps marble
    chameleon openbabel kicad kicad-doc-es librecad dia
    geogebra octave genius kalgebra kmplot mathomatic nasc
    klogic ngspice spice-gtk spice-up
    libreoffice-writer-extensions
  ]
  return names.sort
end

def install(packages)
  system("zypper refresh")
  packages.each do |package|
    isdone = (`zypper info #{package}| grep 'Instalado'|grep 'No'|wc -l`.to_i == 0)
    if isdone
      puts "[ OK ] #{package}"
    else
      puts "[ => ] Installing #{package}..."
      ok = system("zypper in -y #{package}")
      puts "[ERROR] Installing #{package}!" unless ok
    end
  end
end

def add_repos
  puts "[INFO] Repositorios"
  # virtualbox
  system("cp virtualbox.repo /etc/zypp/repos.d")
  system("wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | rpm --import -")
  # visualcode
  system("cp visualcode.repo /etc/zypp/repos.d")
  system("rpm --import https://packages.microsoft.com/keys/microsoft.asc")
  # atom
  system("sh -c 'echo -e \"[Atom]\nname=Atom Editor\nbaseurl=https://packagecloud.io/AtomEditor/atom/el/7/\$basearch\nenabled=1\ntype=rpm-md\ngpgcheck=0\nrepo_gpgcheck=1\ngpgkey=https://packagecloud.io/AtomEditor/atom/gpgkey\" > /etc/zypp/repos.d/atom.repo'")
  system("zypper --gpg-auto-import-keys refresh")
  # Education
  #zypper addrepo https://download.opensuse.org/repositories/Education/openSUSE_Tumbleweed/Education.repo
  ok = system("zypper refresh")
  unless ok
    puts "[ERROR] Catálogos de software"
  end
end

add_repos
install tic
install mul
# install edu

puts "[INFO] Configuraciones varias:"
system("zypper install -y -t pattern devel_C_C++")
system("zyppwe install -y patterns-mate-mate")
# Virtualbox
%w[ super asir daw].each do |username|
  system("usermod #{username} -G vboxusers")
end
system("zypper remove -y pk-update-icon")
system("systemctl disable firewalld")
system("systemctl stop firewalld")

puts "[INFO] Actualizando el sistema:"
system("zypper update")

exit 0

#=======================================
# Virtual box
  #VBoxManage extpack uninstall "Oracle VM VirtualBox Extension Pack"
  #VBoxManage extpack install Oracle_VM_VirtualBox_Extension_Pack-4.3.30-101610.vbox-extpack
  #virtualbox Oracle_VM_VirtualBox_Extension_Pack-*.vbox-extpack &
#
#
# function install_android {
#  add-apt-repository -y ppa:webupd8team/java
#  add-apt-repository -y ppa:didrocks/ubuntu-developer-tools-center
#  add-apt-repository -y ppa:paolorotolo/android-studio
  # Ubuntu-developers-tools-center
#  apt-get -y install ubuntu-developer-tools-center
  # Android SDK
#  apt-get -y install python-software-properties
  # -- Sistemas de 64 bits
#  aptitude install ia32-libs
#  apt-get -y install lib32z1 lib32ncurses5 lib32bz2-1.0 lib32stdc++6
  # Android Studio
#  apt-get -y install android-studio
#}
#
#function dudas {
  # Actualizaciones desde archivos descargados.
#  libreoffice LanguageTool-3.0.oxt &
