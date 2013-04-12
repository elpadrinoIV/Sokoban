require File.dirname(__FILE__) + '/helper.rb'

require 'escenario'
require 'persona'

class TestZonaLibre < Test::Unit::TestCase
  def setup
    @escenario = Escenario.new
    forma_escenario = [ ['w', 'w', 'w', 'w', 'w', 'w'],
                        ['w', ' ', 'w', ' ', ' ', 'w'],
                        ['w', ' ', 'w', 'w', 'w', 'w'],
                        ['w', 'w', 'w', ' ', ' ', ' ']]

   @escenario.cargar_escenario(forma_escenario)
  end
  
=begin
  def test_01a01_mover_izquierda_libre
    @tipito = Persona.new
    @tipito.set_escenario(@escenario)
    @tipito.set_posicion(2, 5)
    assert_equal(true, @tipito.puede_moverse_izquierda?)
    x_original = @tipito.get_x
    @tipito.mover_izquierda
    x_nuevo = @tipito.get_x

    assert_equal(x_original - 1, x_nuevo, "no se movio a la izquierda")
  end
=end
end