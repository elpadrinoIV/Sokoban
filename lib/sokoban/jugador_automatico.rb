require 'escenario'
require 'persona'
class JugadorAutomatico
  def initialize
    
  end

  def set_escenario escenario
    @escenario = escenario
  end

  def ejecutar_instrucciones instrucciones
    persona = @escenario.get_persona
    # print "Pos: (#{persona.get_x}, #{persona.get_y})\n"
    
    (1..instrucciones.length).each do |nro_instruccion|
      case instrucciones[nro_instruccion - 1]
      when 'R'
        # mover derecha
        persona.mover_derecha
      when 'L'
        # mover izquierda
        persona.mover_izquierda
      when 'U'
        # mover arriba
        persona.mover_arriba
      when 'D'
        # mover abajo
        persona.mover_abajo
      end
      # print "Pos: (#{persona.get_x}, #{persona.get_y})\n"
    end
  end
end