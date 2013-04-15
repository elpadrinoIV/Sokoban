require File.dirname(__FILE__) + '/helper.rb'

require 'escenario_loader'
require 'escenario'
require 'caja'

class TestCajas < Test::Unit::TestCase
  def setup
    # WWWWWW
    # W    W
    # W    W
    # W    W
    # W    W
    # WWWWWW
    escenario_loader = EscenarioLoader.new
    archivo = File.dirname(__FILE__) + '/esquema_test_cajas.txt'
    @escenario = escenario_loader.cargar_escenario_desde_archivo(archivo)
  end

  def test_mover_izquierda_libre
    caja = Caja.new
    caja.set_posicion(3, 3)
    @escenario.agregar_caja(caja)
    caja.set_escenario(@escenario)
    
    x_original = caja.get_x
    y_original = caja.get_y
    caja.mover_izquierda
    x_nuevo = caja.get_x
    y_nuevo = caja.get_y

    assert_equal(x_original - 1, x_nuevo, "no se movio a la izquierda")
    assert_equal(y_original, y_nuevo, "no se tiene que mover en y")
  end

  def test_mover_derecha_libre
    caja = Caja.new
    caja.set_posicion(3, 3)
    @escenario.agregar_caja(caja)
    caja.set_escenario(@escenario)

    x_original = caja.get_x
    y_original = caja.get_y
    caja.mover_derecha
    x_nuevo = caja.get_x
    y_nuevo = caja.get_y

    assert_equal(x_original + 1, x_nuevo, "no se movio a la derecha")
    assert_equal(y_original, y_nuevo, "no se tiene que mover en y")
  end

  def test_mover_arriba_libre
    caja = Caja.new
    caja.set_posicion(3, 3)
    @escenario.agregar_caja(caja)
    caja.set_escenario(@escenario)

    x_original = caja.get_x
    y_original = caja.get_y
    caja.mover_arriba
    x_nuevo = caja.get_x
    y_nuevo = caja.get_y

    assert_equal(y_original - 1, y_nuevo, "no se movio arriba")
    assert_equal(x_original, x_nuevo, "no se tiene que mover en x")
  end

  def test_mover_abajo_libre
    caja = Caja.new
    caja.set_posicion(3, 3)
    @escenario.agregar_caja(caja)
    caja.set_escenario(@escenario)

    x_original = caja.get_x
    y_original = caja.get_y
    caja.mover_abajo
    x_nuevo = caja.get_x
    y_nuevo = caja.get_y

    assert_equal(y_original + 1, y_nuevo, "no se movio abajo")
    assert_equal(x_original, x_nuevo, "no se tiene que mover en x")
  end

  def test_mover_izquierda_ocupado_con_pared
    caja = Caja.new
    caja.set_posicion(2, 2)
    @escenario.agregar_caja(caja)
    caja.set_escenario(@escenario)

    x_original = caja.get_x
    y_original = caja.get_y
    caja.mover_izquierda
    x_nuevo = caja.get_x
    y_nuevo = caja.get_y

    assert_equal(x_original, x_nuevo, "no se tiene que mover en x")
    assert_equal(y_original, y_nuevo, "no se tiene que mover en y")
  end

  def test_mover_derecha_ocupado_con_pared
    caja = Caja.new
    caja.set_posicion(5, 2)
    @escenario.agregar_caja(caja)
    caja.set_escenario(@escenario)

    x_original = caja.get_x
    y_original = caja.get_y
    caja.mover_derecha
    x_nuevo = caja.get_x
    y_nuevo = caja.get_y

    assert_equal(x_original, x_nuevo, "no se tiene que mover en x")
    assert_equal(y_original, y_nuevo, "no se tiene que mover en y")
  end

  def test_mover_arriba_ocupado_con_pared
    caja = Caja.new
    caja.set_posicion(2, 2)
    @escenario.agregar_caja(caja)
    caja.set_escenario(@escenario)

    x_original = caja.get_x
    y_original = caja.get_y
    caja.mover_arriba
    x_nuevo = caja.get_x
    y_nuevo = caja.get_y

    assert_equal(x_original, x_nuevo, "no se tiene que mover en x")
    assert_equal(y_original, y_nuevo, "no se tiene que mover en y")
  end

  def test_mover_abajo_ocupado_con_pared
    caja = Caja.new
    caja.set_posicion(2, 5)
    @escenario.agregar_caja(caja)
    caja.set_escenario(@escenario)

    x_original = caja.get_x
    y_original = caja.get_y
    caja.mover_abajo
    x_nuevo = caja.get_x
    y_nuevo = caja.get_y

    assert_equal(x_original, x_nuevo, "no se tiene que mover en x")
    assert_equal(y_original, y_nuevo, "no se tiene que mover en y")
  end

  def test_mover_ocupado_con_caja
    caja_izq_arr = Caja.new
    caja_izq_arr.set_posicion(3, 3)
    @escenario.agregar_caja(caja_izq_arr)
    caja_izq_arr.set_escenario(@escenario)

    caja_der_arr = Caja.new
    caja_der_arr.set_posicion(4, 3)
    @escenario.agregar_caja(caja_der_arr)
    caja_der_arr.set_escenario(@escenario)

    caja_izq_aba = Caja.new
    caja_izq_aba.set_posicion(3, 4)
    @escenario.agregar_caja(caja_izq_aba)
    caja_izq_aba.set_escenario(@escenario)

    caja_der_aba = Caja.new
    caja_der_aba.set_posicion(4, 4)
    @escenario.agregar_caja(caja_der_aba)
    caja_der_aba.set_escenario(@escenario)

    # No se deberia mover a la izquierda
    x_original = caja_der_arr.get_x
    y_original = caja_der_arr.get_y
    caja_der_arr.mover_izquierda
    x_nuevo = caja_der_arr.get_x
    y_nuevo = caja_der_arr.get_y

    assert_equal(x_original, x_nuevo, "no se tiene que mover en x")
    assert_equal(y_original, y_nuevo, "no se tiene que mover en y")

    # No se deberia mover a la derecha
    x_original = caja_izq_arr.get_x
    y_original = caja_izq_arr.get_y
    caja_izq_arr.mover_derecha
    x_nuevo = caja_izq_arr.get_x
    y_nuevo = caja_izq_arr.get_y

    assert_equal(x_original, x_nuevo, "no se tiene que mover en x")
    assert_equal(y_original, y_nuevo, "no se tiene que mover en y")

    # No se deberia mover arriba
    x_original = caja_izq_aba.get_x
    y_original = caja_izq_aba.get_y
    caja_izq_aba.mover_arriba
    x_nuevo = caja_izq_aba.get_x
    y_nuevo = caja_izq_aba.get_y

    assert_equal(x_original, x_nuevo, "no se tiene que mover en x")
    assert_equal(y_original, y_nuevo, "no se tiene que mover en y")

    # No se deberia mover abajo
    x_original = caja_izq_arr.get_x
    y_original = caja_izq_arr.get_y
    caja_izq_arr.mover_abajo
    x_nuevo = caja_izq_arr.get_x
    y_nuevo = caja_izq_arr.get_y

    assert_equal(x_original, x_nuevo, "no se tiene que mover en x")
    assert_equal(y_original, y_nuevo, "no se tiene que mover en y")
  end

end