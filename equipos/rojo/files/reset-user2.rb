#!/usr/bin/ruby
# encoding: utf-8
#
# Descripción: Script para resetar el usuario alumno a se estado original.
# Versión 2

puts "[INFO] Executing <#{$0}> (versión 2)..."

def reset_alumno
  puts "* Setting password"
  system('echo "alumno:tecnologia" | chpasswd')

  puts "* Remove home files"
  system('rm -rf /home/alumno')

  puts "* Restarting home files"
  system('mv alumno ..')
  system('tar xvf alumno.tar')
end

FILE="/home/guest/last_execution.dat"
last_execution=(`cat #{FILE}`).to_i
now=Time.now
today=now.year*10000+now.yday

if today>last_execution
  reset_alumno
  puts "[INFO] OK!"
  system("echo #{today.to_s} > #{FILE}")
else
  puts "[INFO] Nothing done!"
end

