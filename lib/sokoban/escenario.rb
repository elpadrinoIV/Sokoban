require 'destino'
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
    # @items = Array.new
    @destinos = Array.new
    @paredes = Array.new
    @cajas = Array.new
  end

  def esta_libre? (x, y)
    libre = true

    @paredes.each do |item|
      libre = false if (item.ocupa_lugar? && item.get_x == x && item.get_y == y)
    end

    @cajas.each do |item|
      libre = false if (item.ocupa_lugar? && item.get_x == x && item.get_y == y)
    end

     libre
  end

  def item_puede_moverse_a_posicion?(x, y)
    puede_moverse = esta_libre?(x, y)

    @paredes.each do |item|
      if item.get_x == x && item.get_y == y
        puede_moverse = puede_moverse && item.movible?
      end
    end

    @cajas.each do |item|
      if item.get_x == x && item.get_y == y
        puede_moverse = puede_moverse && item.movible?
      end
    end
  end

  def agregar_destino(destino)
    @destinos.push destino
  end

  def agregar_caja(caja)
    @cajas.push caja
  end

  def agregar_pared(pared)
    @paredes.push pared
  end
  
  def dibujar
    escenario = Array.new
    (1..10).each do |nro_fila|
      escenario.push(Array.new(10,' '))
    end

    @paredes.each do |item|
      fila = item.get_y - 1
      col = item.get_x - 1

      escenario[fila][col] = item.get_imagen
    end

    @cajas.each do |item|
      fila = item.get_y - 1
      col = item.get_x - 1

      escenario[fila][col] = item.get_imagen
    end

    @destinos.each do |item|
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

  def todos_los_destinos_ocupados?
    todos_ocupados = true

    @destinos.each do |destino|
      destino_ocupado = false
      @cajas.each do |caja|
        destino_ocupado = true if destino.get_x == caja.get_x && destino.get_y == caja.get_y
      end
      
      todos_ocupados = false if !destino_ocupado
    end
    
    todos_ocupados
  end
end
