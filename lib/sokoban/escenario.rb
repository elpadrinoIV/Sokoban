require 'destino'
require 'historia'
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
    @historia = Historia.new
  end

  def esta_libre? (x, y)
    libre = true
    @paredes.each do |item|
      if (item.ocupa_lugar? && item.get_x == x && item.get_y == y)
        libre = false
      end
    end

    @cajas.each do |item|
      if (item.ocupa_lugar? && item.get_x == x && item.get_y == y)
        libre = false
      end
    end

     libre
  end

  def item_puede_moverse_desde_hasta_posicion?(x_desde, y_desde, x_hasta, y_hasta)
    puede_moverse = esta_libre?(x_hasta, y_hasta)
    @paredes.each do |item|
      if item.get_x == x_desde && item.get_y == y_desde
        puede_moverse = puede_moverse && item.movible?
      end
    end

    @cajas.each do |item|
      if item.get_x == x_desde && item.get_y == y_desde
        puede_moverse = puede_moverse && item.movible?
      end
    end

    puede_moverse
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

  def agregar_persona(persona)
    @persona = persona
  end

  def deshacer
    @historia.deshacer
  end

  def dibujar
    escenario = Array.new
    (1..10).each do |nro_fila|
      escenario.push(Array.new(10,' '))
    end

    @paredes.each do |item|
      fila = item.get_y - 1
      col = item.get_x - 1

      escenario[fila][col] = '#'
    end

    @destinos.each do |item|
      fila = item.get_y - 1
      col = item.get_x - 1

      escenario[fila][col] = '.'
    end

    @cajas.each do |item|
      fila = item.get_y - 1
      col = item.get_x - 1

      if '.' == escenario[fila][col]
        escenario[fila][col] = '*'
      else
        escenario[fila][col] = '$'
      end
    end
    
    if ('.' == escenario[@persona.get_y - 1][@persona.get_x - 1])

      escenario[@persona.get_y - 1][@persona.get_x - 1] = '+'
    else
      escenario[@persona.get_y - 1][@persona.get_x - 1] = '@'
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

  def get_ancho
    max_ancho = 1
    @paredes.each do |pared|
      if pared.get_x > max_ancho
        max_ancho = pared.get_x
      end
    end

    @cajas.each do |caja|
      if caja.get_x > max_ancho
        max_ancho = caja.get_x
      end
    end

    max_ancho
  end

  def get_alto
    max_alto = 1
    @paredes.each do |pared|
      if pared.get_y > max_alto
        max_alto = pared.get_y
      end
    end

    @cajas.each do |caja|
      if caja.get_y > max_alto
        max_alto = caja.get_y
      end
    end

    max_alto
  end

  def get_paredes
    @paredes
  end

  def get_destinos
    @destinos
  end

  def get_cajas
    @cajas
  end

  def get_persona
    @persona
  end

  def get_historia
    @historia
  end
end
