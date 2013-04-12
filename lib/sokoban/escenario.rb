# require 'caja'
require 'Pared'
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

    @escenario = [ ['W', 'W', 'W', 'W', 'W', 'W', ' ', ' '],
                   ['W', ' ', ' ', 'D', ' ', 'W', ' ', ' '],
                   ['W', ' ', ' ', ' ', ' ', 'W', 'W', 'W'],
                   ['W', ' ', 'W', 'B', 'B', 'D', ' ', 'W'],
                   ['W', 'D', ' ', ' ', 'W', 'W', ' ', 'W'],
                   ['W', 'G', 'B', ' ', 'W', 'W', ' ', 'W'],
                   ['W', 'W', 'W', ' ', ' ', ' ', ' ', 'W'],
                   [' ', ' ', 'W', 'W', 'W', 'W', 'W', 'W']]

    @items = Array.new
  end

  def esta_libre? (x, y)
    libre = true

    @items.each do |item|
      libre = false if (item.ocupa_lugar? && item.get_x == x && item.get_y == y)
    end

     libre
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
    
    @escenario.each do |fila|
      fila.each do |elemento|
        print elemento
      end
      print "\n";
    end

  end
end
