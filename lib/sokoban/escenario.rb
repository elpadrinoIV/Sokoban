# require 'caja'
require 'pared'
class Escenario
  def initialize
    # WWWWWW
    # W  D W
    # W    WWW
    # W WBBD W
    # WD  WW W
    # WGB WW W
    # WWW    W
    #   WWWWWW
=begin
    @escenario = [ ['W', 'W', 'W', 'W', 'W', 'W', ' ', ' '],
                   ['W', ' ', ' ', 'D', ' ', 'W', ' ', ' '],
                   ['W', ' ', ' ', ' ', ' ', 'W', 'W', 'W'],
                   ['W', ' ', 'W', 'B', 'B', 'D', ' ', 'W'],
                   ['W', 'D', ' ', ' ', 'W', 'W', ' ', 'W'],
                   ['W', 'G', 'B', ' ', 'W', 'W', ' ', 'W'],
                   ['W', 'W', 'W', ' ', ' ', ' ', ' ', 'W'],
                   [' ', ' ', 'W', 'W', 'W', 'W', 'W', 'W']]
=end
    @items = Array.new
  end

  def esta_libre? (x, y)
    libre = true

    @items.each do |item|
      libre = false if (item.ocupa_lugar? && item.get_x == x && item.get_y == y)
    end

     libre
  end

  def item_puede_moverse_a_posicion?(x, y)
    puede_moverse = esta_libre?(x, y)

    @items.each do |item|
      if item.get_x == x && item.get_y == y
        puede_moverse = puede_moverse && item.movible?
      end
    end
  end

  def cargar_escenario (escenario)
    @escenario = escenario
    
    (1..escenario.length).each do |nro_fila|
      (1..escenario[nro_fila - 1].length).each do |nro_columna|
        case escenario[nro_fila - 1][nro_columna - 1]
        when 'W'
          pared = Pared.new
          pared.set_posicion(nro_columna, nro_fila)
          agregar_item(pared)
        end
      end
    end
  end

  def agregar_item(item)
    @items.push item
  end
  
  def dibujar
    escenario = Array.new
    (1..10).each do |nro_fila|
      escenario.push(Array.new(10,' '))
    end

    @items.each do |item|
      fila = item.get_y - 1
      col = item.get_x - 1

      escenario[fila][col] = item.get_imagen
      
    end
    


    escenario.each do |fila|
      fila.each do |elem|
        print elem
      end
      print "\n"
    end
  

  end
end
