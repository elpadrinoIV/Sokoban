require File.dirname(__FILE__) + '/helper.rb'

require 'escenario_loader'
require 'escenario'
require 'caja'
require 'persona'
require 'jugador_automatico'

class TestJugarNivelEntero < Test::Unit::TestCase
  def test_14a01_nivel_trivial
    escenario_loader = EscenarioLoader.new
    archivo = File.dirname(__FILE__) + '/esquema_test_A1401_nivel_trivial.txt'
    escenario = escenario_loader.cargar_escenario_desde_archivo(archivo)

    jugador_automatico = JugadorAutomatico.new
    jugador_automatico.set_escenario(escenario)

    instrucciones = 'UDLRRLD'
    jugador_automatico.ejecutar_instrucciones(instrucciones)

    assert_equal(true, escenario.todos_los_destinos_ocupados?, "el nivel deberia estar completo")
  end

  def test_14a02_nivel_complejo
    escenario_loader = EscenarioLoader.new
    archivo = File.dirname(__FILE__) + '/esquema_test_A1402_nivel_complejo.txt'
    escenario = escenario_loader.cargar_escenario_desde_archivo(archivo)

    jugador_automatico = JugadorAutomatico.new
    jugador_automatico.set_escenario(escenario)

    instrucciones = 'DLURRRDLULLDDRULURUULDRDDRRULDLUU'
    jugador_automatico.ejecutar_instrucciones(instrucciones)

    assert_equal(true, escenario.todos_los_destinos_ocupados?, "el nivel deberia estar completo")
  end

  def test_14a03_nivel_complejo_movimientos_extras
    escenario_loader = EscenarioLoader.new
    archivo = File.dirname(__FILE__) + '/esquema_test_A1402_nivel_complejo.txt'
    escenario = escenario_loader.cargar_escenario_desde_archivo(archivo)

    jugador_automatico = JugadorAutomatico.new
    jugador_automatico.set_escenario(escenario)

    instrucciones = 'LLDDDDDLUURRRRRRRRDDDDLUUUUULLLLLLLDDDDDDRRRRRRRRRRRULURUULDRDDRRULDLUU'
    jugador_automatico.ejecutar_instrucciones(instrucciones)

    assert_equal(true, escenario.todos_los_destinos_ocupados?, "el nivel deberia estar completo")
  end

end