require File.dirname(__FILE__) + '/helper.rb'

require 'escenario_loader'
require 'persona'

class TestZonaOcupada < Test::Unit::TestCase
  def setup
    # #####
    # #   #
    # #   #
    # #   #
    # #####

    escenario_loader = EscenarioLoader.new
    archivo = File.dirname(__FILE__) + '/esquema_test_A02_mover_zona_ocupada.txt'
    @escenario = escenario_loader.cargar_escenario_desde_archivo(archivo)
  end
  
  def test_02a01_mover_izquierda_ocupado
    tipito = Persona.new
    tipito.set_escenario(@escenario)
    tipito.set_posicion(2, 3)

    assert_equal(false, tipito.puede_moverse_izquierda?)

    x_original = tipito.get_x
    y_original = tipito.get_y
    tipito.mover_izquierda
    x_nuevo = tipito.get_x
    y_nuevo = tipito.get_y

    assert_equal(x_original, x_nuevo, "no se tiene que mover en x")
    assert_equal(y_original, y_nuevo, "no se tiene que mover en y")
  end

end
  