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
      @y = @y + 1 if @escenario.esta_libre?(@x, @y + 1)
  end

  def ocupa_lugar?
    true
  end
end