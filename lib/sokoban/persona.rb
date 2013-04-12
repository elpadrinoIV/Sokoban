# To change this template, choose Tools | Templates
# and open the template in the editor.

require 'caja'
require 'escenario'

class Persona
  def initialize
    @cajas = Array.new
  end

  def set_escenario(escenario)
    @escenario = escenario
  end

  def set_cajas(cajas)
    @cajas = cajas
  end
 
  def mover_izquierda
  end

  def mover_derecha
  end

  def mover_arriba
  end

  def mover_abajo
  end

  def puede_moverse_izquierda?
    true
  end
end
