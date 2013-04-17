require File.dirname(__FILE__) + '/helper.rb'

require 'escenario_loader'
require 'jugador_automatico'

class TestDeshacer < Test::Unit::TestCase
  def setup
    # #######
    # #  .. #
    # #   @ #
    # #   $ #
    # # $   #
    # #######
    
    escenario_loader = EscenarioLoader.new
    archivo = File.dirname(__FILE__) + '/esquema_test_13A_contar_movimientos.txt'
    @escenario = escenario_loader.cargar_escenario_desde_archivo(archivo)
  end
  
  def test_12a01_deshacer_simple_volver_a_original
    jugador_automatico = JugadorAutomatico.new
    jugador_automatico.set_escenario(@escenario)

    x_inicial = @escenario.get_persona.get_x
    y_inicial = @escenario.get_persona.get_y

    instrucciones = 'RULLLDD'
    jugador_automatico.ejecutar_instrucciones(instrucciones)
    instrucciones.length.times do
      @escenario.deshacer
    end

    x_final = @escenario.get_persona.get_x
    y_final = @escenario.get_persona.get_y

    assert_equal(x_inicial, x_final, "El jugador deberia haber quedado en la misma pos_x")
    assert_equal(y_inicial, y_final, "El jugador deberia haber quedado en la misma pos_y")
  end

  def test_12a02_deshacer_simple_varios_undos
    # Mover por zona libre (7 movimientos), 1 undo, 3 undos

    # #######
    # #  .. #
    # #   @ #
    # #   $ #
    # # $   #
    # #######

    jugador_automatico = JugadorAutomatico.new
    jugador_automatico.set_escenario(@escenario)

    instrucciones = 'RULLLDD'
    jugador_automatico.ejecutar_instrucciones(instrucciones)
    
    @escenario.deshacer
    x_esperado = 3
    y_esperado = 3

    x = @escenario.get_persona.get_x
    y = @escenario.get_persona.get_y

    assert_equal(x_esperado, x, "El jugador deberia haber quedado en otra pos_x")
    assert_equal(y_esperado, y, "El jugador deberia haber quedado en otra pos_y")

    3.times do
      @escenario.deshacer
    end
    
    x_esperado = 5
    y_esperado = 2

    x = @escenario.get_persona.get_x
    y = @escenario.get_persona.get_y

    assert_equal(x_esperado, x, "El jugador deberia haber quedado en otra pos_x")
    assert_equal(y_esperado, y, "El jugador deberia haber quedado en otra pos_y")
  end

  def test_12a03_deshacer_mas_undos_que_movimientos
    jugador_automatico = JugadorAutomatico.new
    jugador_automatico.set_escenario(@escenario)

    x_inicial = @escenario.get_persona.get_x
    y_inicial = @escenario.get_persona.get_y

    instrucciones = 'RULLLDD'
    jugador_automatico.ejecutar_instrucciones(instrucciones)
    (instrucciones.length + 5).times do
      @escenario.deshacer
    end

    x_final = @escenario.get_persona.get_x
    y_final = @escenario.get_persona.get_y

    assert_equal(x_inicial, x_final, "El jugador deberia haber quedado en la misma pos_x")
    assert_equal(y_inicial, y_final, "El jugador deberia haber quedado en la misma pos_y")
  end

  def test_12a04_deshacer_zonas_trabadas_no_cuentan
    # 12A04 - Mover por zonas libres y trabadas, mover en zona trabada no cuenta para undo.
    #
    # #######
    # #  .. #
    # #   @ #
    # #   $ #
    # # $   #
    # #######
    jugador_automatico = JugadorAutomatico.new
    jugador_automatico.set_escenario(@escenario)

    instrucciones = 'RUUUUUU'
    jugador_automatico.ejecutar_instrucciones(instrucciones)

    @escenario.deshacer

    x_esperado = 6
    y_esperado = 3

    x = @escenario.get_persona.get_x
    y = @escenario.get_persona.get_y

    assert_equal(x_esperado, x, "El jugador deberia haber quedado en otra pos_x")
    assert_equal(y_esperado, y, "El jugador deberia haber quedado en otra pos_y")

    instrucciones = 'DDDDDDDDDDDLLUUU'
    jugador_automatico.ejecutar_instrucciones(instrucciones)

    @escenario.deshacer

    x_esperado = 4
    y_esperado = 3

    x = @escenario.get_persona.get_x
    y = @escenario.get_persona.get_y

    assert_equal(x_esperado, x, "El jugador deberia haber quedado en otra pos_x")
    assert_equal(y_esperado, y, "El jugador deberia haber quedado en otra pos_y")

    5.times do
      @escenario.deshacer
    end

    x_esperado = 6
    y_esperado = 4

    x = @escenario.get_persona.get_x
    y = @escenario.get_persona.get_y

    assert_equal(x_esperado, x, "El jugador deberia haber quedado en otra pos_x")
    assert_equal(y_esperado, y, "El jugador deberia haber quedado en otra pos_y")
  end

  def test_12a05_deshacer_cajas_y_zonas_trabadas_no_cuentan
    #	12A05 - Mover empujando cajas, trabarse con esas cajas, varias vueltas, varios undos
    #
    # #######
    # #  .. #
    # #   @ #
    # #   $ #
    # # $   #
    # #######
    jugador_automatico = JugadorAutomatico.new
    jugador_automatico.set_escenario(@escenario)

    instrucciones = 'RUUUUUU'
    jugador_automatico.ejecutar_instrucciones(instrucciones)

    @escenario.deshacer

    x_esperado = 6
    y_esperado = 3

    x = @escenario.get_persona.get_x
    y = @escenario.get_persona.get_y

    assert_equal(x_esperado, x, "El jugador deberia haber quedado en otra pos_x")
    assert_equal(y_esperado, y, "El jugador deberia haber quedado en otra pos_y")

    instrucciones = 'LDDDDDDDD'
    jugador_automatico.ejecutar_instrucciones(instrucciones)

    @escenario.deshacer

    x_esperado_persona = 5
    y_esperado_persona = 3

    x_esperado_caja = 5
    y_esperado_caja = 4

    caja_en_posicion_correcta = false
    @escenario.get_cajas.each do |caja|
      if caja.get_x == x_esperado_caja && caja.get_y == y_esperado_caja
        caja_en_posicion_correcta = true
      end
    end

    x_persona = @escenario.get_persona.get_x
    y_persona = @escenario.get_persona.get_y

    assert_equal(x_esperado_persona, x_persona, "El jugador deberia haber quedado en otra pos_x")
    assert_equal(y_esperado_persona, y_persona, "El jugador deberia haber quedado en otra pos_y")
    assert_equal(true, caja_en_posicion_correcta, "No hay cajas en #{x_esperado_caja}, #{y_esperado_caja}")
  end

end
  