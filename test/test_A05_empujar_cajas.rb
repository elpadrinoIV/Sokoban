require File.dirname(__FILE__) + '/helper.rb'

require 'escenario_loader'
require 'escenario'
require 'caja'
require 'persona'

class TestEmpujarCajas < Test::Unit::TestCase
  def setup
    # ######
    # #    #
    # #    #
    # #    #
    # #    #
    # ######

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

  def test_05a05_empujar_caja_izquierda_ocupado_con_pared
    caja = Caja.new
    caja.set_posicion(2, 3)
    @escenario.agregar_caja(caja)
    caja.set_escenario(@escenario)

    tipito = Persona.new
    tipito.set_posicion(3, 3)
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

    assert_equal(x_original_caja, x_nuevo_caja, "la caja no se tiene que mover en x")
    assert_equal(y_original_caja, y_nuevo_caja, "la caja no se tiene que mover en y")
    assert_equal(x_original_tipito, x_nuevo_tipito, "el tipito no se tiene que mover en x")
    assert_equal(y_original_tipito, y_nuevo_tipito, "el tipito no se tiene que mover en y")
  end

  def test_05a06_empujar_caja_derecha_ocupado_con_pared
    caja = Caja.new
    caja.set_posicion(5, 3)
    @escenario.agregar_caja(caja)
    caja.set_escenario(@escenario)

    tipito = Persona.new
    tipito.set_posicion(4, 3)
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

    assert_equal(x_original_caja, x_nuevo_caja, "la caja no se tiene que mover en x")
    assert_equal(y_original_caja, y_nuevo_caja, "la caja no se tiene que mover en y")
    assert_equal(x_original_tipito, x_nuevo_tipito, "el tipito no se tiene que mover en x")
    assert_equal(y_original_tipito, y_nuevo_tipito, "el tipito no se tiene que mover en y")
  end

  def test_05a07_empujar_caja_arriba_ocupado_con_pared
    caja = Caja.new
    caja.set_posicion(3, 2)
    @escenario.agregar_caja(caja)
    caja.set_escenario(@escenario)

    tipito = Persona.new
    tipito.set_posicion(3, 3)
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
    assert_equal(y_original_caja, y_nuevo_caja, "la caja no se tiene que mover en y")
    assert_equal(x_original_tipito, x_nuevo_tipito, "el tipito no se tiene que mover en x")
    assert_equal(y_original_tipito, y_nuevo_tipito, "el tipito no se tiene que mover en y")
  end

  def test_05a08_empujar_caja_abajo_ocupado_con_pared
    caja = Caja.new
    caja.set_posicion(3, 5)
    @escenario.agregar_caja(caja)
    caja.set_escenario(@escenario)

    tipito = Persona.new
    tipito.set_posicion(3, 4)
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
    assert_equal(y_original_caja, y_nuevo_caja, "la caja no se tiene que mover en y")
    assert_equal(x_original_tipito, x_nuevo_tipito, "el tipito no se tiene que mover en x")
    assert_equal(y_original_tipito, y_nuevo_tipito, "el tipito no se tiene que mover en y")
  end

  def test_05a09_empujar_caja_a_la_izquierda_ocupado_con_caja
    caja_izq = Caja.new
    caja_izq.set_posicion(3, 3)
    @escenario.agregar_caja(caja_izq)
    caja_izq.set_escenario(@escenario)

    caja_der = Caja.new
    caja_der.set_posicion(4, 3)
    @escenario.agregar_caja(caja_der)
    caja_der.set_escenario(@escenario)

    tipito = Persona.new
    tipito.set_posicion(5, 3)
    tipito.set_escenario(@escenario)

    x_original_caja_izq = caja_izq.get_x
    y_original_caja_izq = caja_izq.get_y
    x_original_caja_der = caja_der.get_x
    y_original_caja_der = caja_der.get_y
    x_original_tipito = tipito.get_x
    y_original_tipito = tipito.get_y
    tipito.mover_izquierda
    x_nuevo_caja_izq = caja_izq.get_x
    y_nuevo_caja_izq = caja_izq.get_y
    x_nuevo_caja_der = caja_der.get_x
    y_nuevo_caja_der = caja_der.get_y
    x_nuevo_tipito = tipito.get_x
    y_nuevo_tipito = tipito.get_y

    assert_equal(x_original_caja_izq, x_nuevo_caja_izq, "la caja no se tiene que mover en x")
    assert_equal(y_original_caja_izq, y_nuevo_caja_izq, "la caja no se tiene que mover en y")
    assert_equal(x_original_caja_der, x_nuevo_caja_der, "la caja no se tiene que mover en x")
    assert_equal(y_original_caja_der, y_nuevo_caja_der, "la caja no se tiene que mover en y")
    assert_equal(x_original_tipito, x_nuevo_tipito, "el tipito no se tiene que mover en x")
    assert_equal(y_original_tipito, y_nuevo_tipito, "el tipito no se tiene que mover en y")
  end

  def test_05a10_empujar_caja_a_la_derecha_ocupado_con_caja
    caja_izq = Caja.new
    caja_izq.set_posicion(3, 3)
    @escenario.agregar_caja(caja_izq)
    caja_izq.set_escenario(@escenario)

    caja_der = Caja.new
    caja_der.set_posicion(4, 3)
    @escenario.agregar_caja(caja_der)
    caja_der.set_escenario(@escenario)

    tipito = Persona.new
    tipito.set_posicion(2, 3)
    tipito.set_escenario(@escenario)

    x_original_caja_izq = caja_izq.get_x
    y_original_caja_izq = caja_izq.get_y
    x_original_caja_der = caja_der.get_x
    y_original_caja_der = caja_der.get_y
    x_original_tipito = tipito.get_x
    y_original_tipito = tipito.get_y
    tipito.mover_derecha
    x_nuevo_caja_izq = caja_izq.get_x
    y_nuevo_caja_izq = caja_izq.get_y
    x_nuevo_caja_der = caja_der.get_x
    y_nuevo_caja_der = caja_der.get_y
    x_nuevo_tipito = tipito.get_x
    y_nuevo_tipito = tipito.get_y

    assert_equal(x_original_caja_izq, x_nuevo_caja_izq, "la caja no se tiene que mover en x")
    assert_equal(y_original_caja_izq, y_nuevo_caja_izq, "la caja no se tiene que mover en y")
    assert_equal(x_original_caja_der, x_nuevo_caja_der, "la caja no se tiene que mover en x")
    assert_equal(y_original_caja_der, y_nuevo_caja_der, "la caja no se tiene que mover en y")
    assert_equal(x_original_tipito, x_nuevo_tipito, "el tipito no se tiene que mover en x")
    assert_equal(y_original_tipito, y_nuevo_tipito, "el tipito no se tiene que mover en y")
  end

  def test_05a11_empujar_caja_arriba_ocupado_con_caja
    caja_arr = Caja.new
    caja_arr.set_posicion(3, 3)
    @escenario.agregar_caja(caja_arr)
    caja_arr.set_escenario(@escenario)

    caja_aba = Caja.new
    caja_aba.set_posicion(3, 4)
    @escenario.agregar_caja(caja_aba)
    caja_aba.set_escenario(@escenario)

    tipito = Persona.new
    tipito.set_posicion(3, 5)
    tipito.set_escenario(@escenario)

    x_original_caja_arr = caja_arr.get_x
    y_original_caja_arr = caja_arr.get_y
    x_original_caja_aba = caja_aba.get_x
    y_original_caja_aba = caja_aba.get_y
    x_original_tipito = tipito.get_x
    y_original_tipito = tipito.get_y
    tipito.mover_arriba
    x_nuevo_caja_arr = caja_arr.get_x
    y_nuevo_caja_arr = caja_arr.get_y
    x_nuevo_caja_aba = caja_aba.get_x
    y_nuevo_caja_aba = caja_aba.get_y
    x_nuevo_tipito = tipito.get_x
    y_nuevo_tipito = tipito.get_y

    assert_equal(x_original_caja_arr, x_nuevo_caja_arr, "la caja no se tiene que mover en x")
    assert_equal(y_original_caja_arr, y_nuevo_caja_arr, "la caja no se tiene que mover en y")
    assert_equal(x_original_caja_aba, x_nuevo_caja_aba, "la caja no se tiene que mover en x")
    assert_equal(y_original_caja_aba, y_nuevo_caja_aba, "la caja no se tiene que mover en y")
    assert_equal(x_original_tipito, x_nuevo_tipito, "el tipito no se tiene que mover en x")
    assert_equal(y_original_tipito, y_nuevo_tipito, "el tipito no se tiene que mover en y")
  end

  def test_05a12_empujar_caja_abajo_ocupado_con_caja
    caja_arr = Caja.new
    caja_arr.set_posicion(3, 3)
    @escenario.agregar_caja(caja_arr)
    caja_arr.set_escenario(@escenario)

    caja_aba = Caja.new
    caja_aba.set_posicion(3, 4)
    @escenario.agregar_caja(caja_aba)
    caja_aba.set_escenario(@escenario)

    tipito = Persona.new
    tipito.set_posicion(3, 2)
    tipito.set_escenario(@escenario)

    x_original_caja_arr = caja_arr.get_x
    y_original_caja_arr = caja_arr.get_y
    x_original_caja_aba = caja_aba.get_x
    y_original_caja_aba = caja_aba.get_y
    x_original_tipito = tipito.get_x
    y_original_tipito = tipito.get_y
    tipito.mover_abajo
    x_nuevo_caja_arr = caja_arr.get_x
    y_nuevo_caja_arr = caja_arr.get_y
    x_nuevo_caja_aba = caja_aba.get_x
    y_nuevo_caja_aba = caja_aba.get_y
    x_nuevo_tipito = tipito.get_x
    y_nuevo_tipito = tipito.get_y

    assert_equal(x_original_caja_arr, x_nuevo_caja_arr, "la caja no se tiene que mover en x")
    assert_equal(y_original_caja_arr, y_nuevo_caja_arr, "la caja no se tiene que mover en y")
    assert_equal(x_original_caja_aba, x_nuevo_caja_aba, "la caja no se tiene que mover en x")
    assert_equal(y_original_caja_aba, y_nuevo_caja_aba, "la caja no se tiene que mover en y")
    assert_equal(x_original_tipito, x_nuevo_tipito, "el tipito no se tiene que mover en x")
    assert_equal(y_original_tipito, y_nuevo_tipito, "el tipito no se tiene que mover en y")
  end
end