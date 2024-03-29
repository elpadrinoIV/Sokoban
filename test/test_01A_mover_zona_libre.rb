require File.dirname(__FILE__) + '/helper.rb'

require 'escenario_loader'
require 'persona'

class TestZonaLibre < Test::Unit::TestCase
  def setup
    # ######
    # #.# .#
    # # ####
    # ###

    escenario_loader = EscenarioLoader.new
    archivo = File.dirname(__FILE__) + '/esquema_test_01A_mover_zona_libre.txt'
    @escenario = escenario_loader.cargar_escenario_desde_archivo(archivo)
  end
  
  def test_01a01_mover_izquierda_libre
    tipito = Persona.new
    tipito.set_escenario(@escenario)
    tipito.set_posicion(5, 2)

    assert_equal(true, tipito.puede_moverse_izquierda?)

    x_original = tipito.get_x
    y_original = tipito.get_y
    tipito.mover_izquierda
    x_nuevo = tipito.get_x
    y_nuevo = tipito.get_y

    assert_equal(x_original - 1, x_nuevo, "no se movio a la izquierda")
    assert_equal(y_original, y_nuevo, "no se tiene que mover en y")
  end

  def test_01a02_mover_derecha_libre
    tipito = Persona.new
    tipito.set_escenario(@escenario)
    tipito.set_posicion(4, 2)

    assert_equal(true, tipito.puede_moverse_derecha?)

    x_original = tipito.get_x
    y_original = tipito.get_y
    tipito.mover_derecha
    x_nuevo = tipito.get_x
    y_nuevo = tipito.get_y

    assert_equal(x_original + 1, x_nuevo, "no se movio a la derecha")
    assert_equal(y_original, y_nuevo, "no se tiene que mover en y")
  end

  def test_01a03_mover_arriba_libre
    tipito = Persona.new
    tipito.set_escenario(@escenario)
    tipito.set_posicion(2, 3)

    assert_equal(true, tipito.puede_moverse_arriba?)

    x_original = tipito.get_x
    y_original = tipito.get_y
    tipito.mover_arriba
    x_nuevo = tipito.get_x
    y_nuevo = tipito.get_y

    assert_equal(x_original, x_nuevo, "no se tiene que mover en x")
    assert_equal(y_original - 1, y_nuevo, "no se movio arriba")
  end

  def test_01a04_mover_abajo_libre
    tipito = Persona.new
    tipito.set_escenario(@escenario)
    tipito.set_posicion(2, 2)

    assert_equal(true, tipito.puede_moverse_abajo?)

    x_original = tipito.get_x
    y_original = tipito.get_y
    tipito.mover_abajo
    x_nuevo = tipito.get_x
    y_nuevo = tipito.get_y

    assert_equal(x_original, x_nuevo, "no se tiene que mover en x")
    assert_equal(y_original + 1, y_nuevo, "no se movio arriba")
  end
end
  