# To change this template, choose Tools | Templates
# and open the template in the editor.

require 'caja'
require 'escenario'
require 'item'
require 'historia'

class Persona < Item
  def initialize
    @cantidad_movimientos = 0
  end

  def set_escenario(escenario)
    @escenario = escenario
  end
 
  def mover_izquierda
    historia = @escenario.get_historia
    historia.empezar_evento

    if puede_moverse_izquierda?
      caja_a_la_izquierda = caja_en_posicion(@x - 1, @y)
      if nil != caja_a_la_izquierda
        caja_a_la_izquierda.mover_izquierda

        historia.caja_se_movio(caja_a_la_izquierda, @x - 1, @y, @x - 2, @y)
      end

      historia.persona_se_movio(self, @x, @y, @x - 1, @y)
      @x = @x - 1
      @cantidad_movimientos = @cantidad_movimientos + 1
    end

    historia.terminar_evento
  end

  def mover_derecha
    historia = @escenario.get_historia
    historia.empezar_evento

    if puede_moverse_derecha?
      caja_a_la_derecha = caja_en_posicion(@x + 1, @y)
      if nil != caja_a_la_derecha
        caja_a_la_derecha.mover_derecha

        historia.caja_se_movio(caja_a_la_derecha, @x + 1, @y, @x + 2, @y)
      end

      historia.persona_se_movio(self, @x, @y, @x + 1, @y)

      @x = @x + 1
      @cantidad_movimientos = @cantidad_movimientos + 1
    end

    historia.terminar_evento
  end

  def mover_arriba
    historia = @escenario.get_historia
    historia.empezar_evento

    if puede_moverse_arriba?
      caja_arriba = caja_en_posicion(@x, @y - 1)
      if nil != caja_arriba
        caja_arriba.mover_arriba

        historia.caja_se_movio(caja_arriba, @x, @y - 1, @x, @y - 2)
      end

      historia.persona_se_movio(self, @x, @y, @x, @y - 1)

      @y = @y - 1
      @cantidad_movimientos = @cantidad_movimientos + 1
    end

    historia.terminar_evento
  end

  def mover_abajo
    historia = @escenario.get_historia
    historia.empezar_evento

    if puede_moverse_abajo?
      caja_abajo = caja_en_posicion(@x, @y + 1)
      if nil != caja_abajo
        caja_abajo.mover_abajo

        historia.caja_se_movio(caja_abajo, @x, @y + 1, @x, @y + 2)
      end

      historia.persona_se_movio(self, @x, @y, @x, @y + 1)

      @y = @y + 1
      @cantidad_movimientos = @cantidad_movimientos + 1
    end

    historia.terminar_evento
  end

  def puede_moverse_izquierda?
    @escenario.esta_libre?(@x - 1, @y) || @escenario.item_puede_moverse_desde_hasta_posicion?(@x - 1, @y, @x - 2, @y)
  end

  def puede_moverse_derecha?
    @escenario.esta_libre?(@x + 1, @y) || @escenario.item_puede_moverse_desde_hasta_posicion?(@x + 1, @y, @x + 2, @y)
  end

  def puede_moverse_arriba?
    @escenario.esta_libre?(@x, @y - 1) || @escenario.item_puede_moverse_desde_hasta_posicion?(@x, @y - 1, @x, @y - 2)
  end

  def puede_moverse_abajo?
    @escenario.esta_libre?(@x, @y + 1) || @escenario.item_puede_moverse_desde_hasta_posicion?(@x, @y + 1, @x, @y + 2)
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

  def get_cantidad_movimientos
    @cantidad_movimientos
  end

  def cambiar_cantidad_movimientos cantidad
    @cantidad_movimientos = cantidad if (cantidad >= 0)
  end
end
