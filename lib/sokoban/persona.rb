# To change this template, choose Tools | Templates
# and open the template in the editor.

require 'caja'
require 'escenario'
require 'item'

class Persona < Item
  def initialize
  end

  def set_escenario(escenario)
    @escenario = escenario
  end
 
  def mover_izquierda
    if puede_moverse_izquierda?
      @x = @x - 1
    end
  end

  def mover_derecha
    if puede_moverse_derecha?
      @x = @x + 1
    end
  end

  def mover_arriba
    if puede_moverse_arriba?
      @y = @y - 1
    end
  end

  def mover_abajo
    if puede_moverse_abajo?
      @y = @y + 1
    end
  end

  def puede_moverse_izquierda?
    @escenario.esta_libre?(@x - 1, @y) || @escenario.item_puede_moverse_a_posicion?(@x - 2, @y)
  end

  def puede_moverse_derecha?
    @escenario.esta_libre?(@x + 1, @y) || @escenario.item_puede_moverse_a_posicion?(@x + 2, @y)
  end

  def puede_moverse_arriba?
    @escenario.esta_libre?(@x, @y - 1) || @escenario.item_puede_moverse_a_posicion?(@x, @y - 2)
  end

  def puede_moverse_abajo?
    @escenario.esta_libre?(@x, @y + 1) || @escenario.item_puede_moverse_a_posicion?(@x, @y + 2)
  end

  def get_imagen
    'G'
  end
end
