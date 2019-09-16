#!/usr/bin/ruby
# encoding: utf-8
#
# $File: create-moodle-list.rb
#
# $Description:
#   Por argumentos de entrada se para nombre de un fichero CSV,
#   con los datos de los alumnos (generados por el programa PinceEkade).
#   Este script procesa los datos y crea un fichero TXT por cada grupo
#   para usarlo en:
#   1) Carga de datos en Moodle.
#   2) Se pasa a los tutores y ellos comunican los datos a sus alumnos.

require 'pry'

# ListPeople#create_list_for
class ListPeople
  def initialize
    @debug = false
    @verbose = true
    @outputfilename = 'usuarios'
    @output = {}
    @change = [%w[á a], %w[é e], %w[í i], %w[ó o], %w[ú u],
               %w[Á a], %w[É e], %w[Í i], %w[Ó o], %w[Ú u],
               %w[Ñ n], %w[ñ n], [' ', '']]
  end

  def create_list_for(input)
    if input == '--help'
      show_help
    else
      process(input)
    end
  end

  def process(filename)
    data = read_content_of(filename)
    data.each do |line|
      items = get_items_hash_from(line)
      items[:username] = get_username(items)
      items[:email] = "#{items[:username]}@cambiar-email.#{items[:grupo]}" if items[:email].size < 2
      if @output[items[:grupo]].nil?
        f = File.open("#{@outputfilename}_#{items[:grupo]}.txt", 'w')
        @output[items[:grupo]] = f
        f.write("username;password;firstname;lastname;email;city\n")
      end
      # username, password, firstname, lastname, email, city
      msg = "#{items[:username]};#{items[:clave]};#{items[:nombre]};" \
            "#{items[:apellidos]};#{items[:email]};#{items[:grupo]}"
      verbose(msg)
      @output[items[:grupo]].write("#{msg}\n")
    end
    @output.each_value(&:close)
  end

  private

  def read_content_of(filename)
    # Open and read input filename
    verbose "\n[INFO] Processing <#{filename}>..."
    unless File.exist? filename
      puts "[ERROR] <#{filename}> dosn't exist!\n"
      raise "[ERROR] <#{filename}> dosn't exist!\n"
    end
    file = File.open(filename, 'r')
    content = file.readlines
    file.close
    content
  end

  def get_items_hash_from(line)
    input = line.split(',')
    raise 'Error en los campos del CVS' if input.size < 5

    items = {}
    items[:grupo] = input[0].downcase
    items[:clave] = input[1].downcase
    items[:clave] = '201920' if items[:clave].size < 2
    items[:nombre] = input[2].capitalize
    items[:apellido1] = input[3].capitalize
    items[:apellido2] = input[4].capitalize
    items[:apellidos] = items[:apellido1] + ' ' + items[:apellido2]
    items[:email] = input[5].gsub!("\n", '').downcase
    items
  end

  def get_username(items)
    u = items[:nombre][0..2] + items[:apellido1].gsub(' ', '')[0..2]
    u += (items[:apellido2].gsub(' ', '')[0..2] ||
          items[:apellido1].gsub(' ', '')[0..2])
    username = u.downcase
    @change.each { |i| username.gsub!(i[0], i[1]) }
    username
  end

  def execute_command(command)
    verbose "(*) Executing: #{command}"
    system(command) unless @debug
  end

  def show_help
    puts 'Uso:'
    puts " #{$PROGRAM_NAME} FICHERO.csv\n\n"
    puts 'INPUT  : Formato del fichero CSV:'
    puts '         grupo, clave/DNI, nombre, apellido1, apellido2, email'
    puts 'OUTPUT : Varios ficheros TXT. Uno por grupo.'
  end

  def verbose(text)
    puts text if @verbose
  end
end

i = ListPeople.new
i.create_list_for(ARGV.first || '--help')
