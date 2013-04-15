require File.dirname(__FILE__) + '/helper.rb'

require 'escenario_loader'

class TestNivelCompletado < Test::Unit::TestCase
  def setup
    # WWWWW
    # WD  W
    # W D W
    # W  DW
    # WWWWW

    escenario_loader = EscenarioLoader.new
    archivo = File.dirname(__FILE__) + '/esquema_test_A03_nivel_completado.txt'
    @escenario = escenario_loader.cargar_escenario_desde_archivo(archivo)
  end
  
  def test_3_luces_3_cajas
    caja1 = Caja.new
    caja1.set_posicion(2, 2)
    @escenario.agregar_caja(caja1)
    caja1.set_escenario(@escenario)

    caja2 = Caja.new
    caja2.set_posicion(3, 3)
    @escenario.agregar_caja(caja2)
    caja2.set_escenario(@escenario)

    caja3 = Caja.new
    caja3.set_posicion(4, 4)
    @escenario.agregar_caja(caja3)
    caja3.set_escenario(@escenario)

    assert_equal(true, @escenario.todos_los_destinos_ocupados?, "todos los destinos deberian estar ocupados")
  end

  def test_3_luces_4_cajas
    caja1 = Caja.new
    caja1.set_posicion(2, 2)
    @escenario.agregar_caja(caja1)
    caja1.set_escenario(@escenario)

    caja2 = Caja.new
    caja2.set_posicion(3, 3)
    @escenario.agregar_caja(caja2)
    caja2.set_escenario(@escenario)

    caja3 = Caja.new
    caja3.set_posicion(4, 4)
    @escenario.agregar_caja(caja3)
    caja3.set_escenario(@escenario)

    caja4 = Caja.new
    caja4.set_posicion(3, 2)
    @escenario.agregar_caja(caja4)
    caja4.set_escenario(@escenario)

    assert_equal(true, @escenario.todos_los_destinos_ocupados?, "todos los destinos deberian estar ocupados")
  end

end

    