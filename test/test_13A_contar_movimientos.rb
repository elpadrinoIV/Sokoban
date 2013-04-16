require File.dirname(__FILE__) + '/helper.rb'

require 'escenario_loader'
require 'jugador_automatico'

class TestContarMovimientos < Test::Unit::TestCase
  def setup
    # #######
    # #     #
    # #   @ #
    # #   $ #
    # # $   #
    # #######
    
    escenario_loader = EscenarioLoader.new
    archivo = File.dirname(__FILE__) + '/esquema_test_13A_contar_movimientos.txt'
    @escenario = escenario_loader.cargar_escenario_desde_archivo(archivo)
  end
  
  def test_13a01_contar_mover_libre
    jugador_automatico = JugadorAutomatico.new
    jugador_automatico.set_escenario(@escenario)

    instrucciones = 'URDLLLDLUURRR'
    jugador_automatico.ejecutar_instrucciones(instrucciones)

    assert_equal(instrucciones.length, @escenario.get_persona.get_cantidad_movimientos, "Cantidad de movimientos erroneos")
  end

  def test_13a02_contar_mover_libre_y_empujar
    jugador_automatico = JugadorAutomatico.new
    jugador_automatico.set_escenario(@escenario)

    instrucciones = 'RDLDLULURURDD'
    jugador_automatico.ejecutar_instrucciones(instrucciones)

    assert_equal(instrucciones.length, @escenario.get_persona.get_cantidad_movimientos, "Cantidad de movimientos erroneos")
  end

  def test_13a03_contar_mover_libre_empujar_y_paredes_y_cajas_bloqueadas
    jugador_automatico = JugadorAutomatico.new
    jugador_automatico.set_escenario(@escenario)

    # #######
    # #     #
    # #   @ #
    # #   $ #
    # # $   #
    # #######

    instrucciones = 'RDLDLUU' + 'UUUUUU' + 'LL' + 'LLLLLL' + 'DD' + 'DDDDD' + 'RRR' + 'RRRRRR'
    cantidad_movimientos_reales = 7 + 2 + 2 + 3
    jugador_automatico.ejecutar_instrucciones(instrucciones)

    assert_equal(cantidad_movimientos_reales, @escenario.get_persona.get_cantidad_movimientos, "Cantidad de movimientos erroneos")
  end
end
  