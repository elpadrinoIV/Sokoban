require File.dirname(__FILE__) + '/helper.rb'

require 'escenario_loader'
require 'escenario'
require 'caja'
require 'persona'

class TestEmpujarCajas < Test::Unit::TestCase
  def setup
    # WWWWWW
    # W    W
    # W    W
    # W    W
    # W    W
    # WWWWWW
    escenario_loader = EscenarioLoader.new
    archivo = File.dirname(__FILE__) + '/esquema_test_A05_empujar_cajas.txt'
    @escenario = escenario_loader.cargar_escenario_desde_archivo(archivo)
  end

  def test_05a01_empujar_caja_izquierda_libre
    caja = Caja.new
    caja.set_posicion(3, 3)
    @escenario.agregar_caja(caja)
    caja.set_escenario(@escenario)

    tipito = Persona.new
    tipito.set_posicion(4, 3)
    tipito.set_escenario(@escenario)
    
    x_original_caja = caja.get_x
    y_original_caja = caja.get_y
    x_original_tipito = tipito.get_x
    y_original_tipito = tipito.get_y
    tipito.mover_izquierda
    x_nuevo_caja = caja.get_x
    y_nuevo_caja = caja.get_y
    x_nuevo_tipito = tipito.get_x
    y_nuevo_tipito = tipito.get_y

    assert_equal(x_original_caja - 1, x_nuevo_caja, "la caja no se movio a la izquierda")
    assert_equal(y_original_caja, y_nuevo_caja, "la caja no se tiene que mover en y")
    assert_equal(x_original_tipito - 1, x_nuevo_tipito, "el tipito no se movio a la izquierda")
    assert_equal(y_original_tipito, y_nuevo_tipito, "el tipito no se tiene que mover en y")
  end

  def test_05a02_empujar_caja_derecha_libre
    caja = Caja.new
    caja.set_posicion(3, 3)
    @escenario.agregar_caja(caja)
    caja.set_escenario(@escenario)

    tipito = Persona.new
    tipito.set_posicion(2, 3)
    tipito.set_escenario(@escenario)

    x_original_caja = caja.get_x
    y_original_caja = caja.get_y
    x_original_tipito = tipito.get_x
    y_original_tipito = tipito.get_y
    tipito.mover_derecha
    x_nuevo_caja = caja.get_x
    y_nuevo_caja = caja.get_y
    x_nuevo_tipito = tipito.get_x
    y_nuevo_tipito = tipito.get_y

    assert_equal(x_original_caja + 1, x_nuevo_caja, "la caja no se movio a la derecha")
    assert_equal(y_original_caja, y_nuevo_caja, "la caja no se tiene que mover en y")
    assert_equal(x_original_tipito + 1, x_nuevo_tipito, "el tipito no se movio a la derecha")
    assert_equal(y_original_tipito, y_nuevo_tipito, "el tipito no se tiene que mover en y")
  end

  def test_05a03_empujar_caja_arriba_libre
    caja = Caja.new
    caja.set_posicion(3, 3)
    @escenario.agregar_caja(caja)
    caja.set_escenario(@escenario)

    tipito = Persona.new
    tipito.set_posicion(3, 4)
    tipito.set_escenario(@escenario)

    x_original_caja = caja.get_x
    y_original_caja = caja.get_y
    x_original_tipito = tipito.get_x
    y_original_tipito = tipito.get_y
    tipito.mover_arriba
    x_nuevo_caja = caja.get_x
    y_nuevo_caja = caja.get_y
    x_nuevo_tipito = tipito.get_x
    y_nuevo_tipito = tipito.get_y

    assert_equal(x_original_caja, x_nuevo_caja, "la caja no se tiene que mover en x")
    assert_equal(y_original_caja - 1, y_nuevo_caja, "la caja no se movio arriba")
    assert_equal(x_original_tipito, x_nuevo_tipito, "el tipito no se tiene que mover en x")
    assert_equal(y_original_tipito - 1, y_nuevo_tipito, "el tipito no se movio arriba")
  end

  def test_05a04_empujar_caja_abajo_libre
    caja = Caja.new
    caja.set_posicion(3, 3)
    @escenario.agregar_caja(caja)
    caja.set_escenario(@escenario)

    tipito = Persona.new
    tipito.set_posicion(3, 2)
    tipito.set_escenario(@escenario)

    x_original_caja = caja.get_x
    y_original_caja = caja.get_y
    x_original_tipito = tipito.get_x
    y_original_tipito = tipito.get_y
    tipito.mover_abajo
    x_nuevo_caja = caja.get_x
    y_nuevo_caja = caja.get_y
    x_nuevo_tipito = tipito.get_x
    y_nuevo_tipito = tipito.get_y

    assert_equal(x_original_caja, x_nuevo_caja, "la caja no se tiene que mover en x")
    assert_equal(y_original_caja + 1, y_nuevo_caja, "la caja no se movio abajo")
    assert_equal(x_original_tipito, x_nuevo_tipito, "el tipito no se tiene que mover en x")
    assert_equal(y_original_tipito + 1, y_nuevo_tipito, "el tipito no se movio abajo")
  end

end