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
    (1..instrucciones.length).each do |nro_undo|
      @escenario.deshacer
    end

    x_final = @escenario.get_persona.get_x
    y_final = @escenario.get_persona.get_y

    assert_equal(x_inicial, x_final, "El jugador deberia haber quedado en la misma pos_x")
    assert_equal(y_inicial, y_final, "El jugador deberia haber quedado en la misma pos_y")
  end

end
  