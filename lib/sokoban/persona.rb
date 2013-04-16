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
      caja_a_la_izquierda = caja_en_posicion(@x - 1, @y)
      if nil != caja_a_la_izquierda
        caja_a_la_izquierda.mover_izquierda
      end
      @x = @x - 1
    end
  end

  def mover_derecha
    if puede_moverse_derecha?
      caja_a_la_derecha = caja_en_posicion(@x + 1, @y)
      if nil != caja_a_la_derecha
        caja_a_la_derecha.mover_derecha
      end
      @x = @x + 1
    end
  end

  def mover_arriba
    if puede_moverse_arriba?
      caja_arriba = caja_en_posicion(@x, @y - 1)
      if nil != caja_arriba
        caja_arriba.mover_arriba
      end
      @y = @y - 1
    end
  end

  def mover_abajo
    if puede_moverse_abajo?
      caja_abajo = caja_en_posicion(@x, @y + 1)
      if nil != caja_abajo
        caja_abajo.mover_abajo
      end
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

  def caja_en_posicion (x, y)
    caja_en_pos = nil
    @escenario.get_cajas.each do |caja|
      caja_en_pos = caja if caja.get_x == x && caja.get_y == y
    end
    caja_en_pos
  end
end
