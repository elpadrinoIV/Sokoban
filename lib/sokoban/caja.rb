require 'escenario'
require 'item'

class Caja < Item
  
  def initialize
  end

  def set_escenario(escenario)
    @escenario = escenario
  end

  def mover_izquierda
    @x = @x - 1 if @escenario.esta_libre?(@x - 1, @y)
  end

  def mover_derecha
      @x = @x + 1 if @escenario.esta_libre?(@x + 1, @y)
  end

  def mover_arriba
    @y = @y - 1 if @escenario.esta_libre?(@x, @y - 1)
  end

  def mover_abajo
    print "mover abajo desde #{@y}\n"
      @y = @y + 1 if @escenario.esta_libre?(@x, @y + 1)
  end

  def se_puede_izquierda?
    @escenario.esta_libre?(@x - 1, @y)
  end

  def se_puede_derecha?
    @escenario.esta_libre?(@x + 1, @y)
  end

  def se_puede_arriba?
    @escenario.esta_libre?(@x, @y - 1)
  end

  def se_puede_abajo?
    @escenario.esta_libre?(@x, @y + 1)
  end

  def ocupa_lugar?
    true
  end

  def get_imagen
    'B'
  end

  def movible?
    true
  end
end
