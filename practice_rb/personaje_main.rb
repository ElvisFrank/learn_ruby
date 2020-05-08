$LOAD_PATH << "."
require "personaje"

p1 = Personaje.new(120, 'Mago', ['hechizos', 'invisibilidad'])
#motrar
puts "Vida: #{p1.vida.to_s}, Tipo: #{p1.tipo}, Poderes: #{p1.armas.join(' - ')}"
#guardar
File.open('juego', 'w+') { |f| Marshal.dump(p1, f) }
#cargar
File.open('juego') { |f| @p1 = Marshal.load(f) }
#motrar
puts "Vida: #{@p1.vida.to_s}, Tipo: #{@p1.tipo}, Poderes: #{@p1.armas.join(' - ')}"
