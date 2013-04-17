class Historia
  ESTADOS = [:comenzado, :terminado]
  QUIEN_HIZO_ACCION = [:persona, :caja]
  def initialize
    @historia = Array.new

    @estado_evento = :terminado
  end

  def empezar_evento
    @estado_evento = :comenzado
    @evento_actual = Array.new
  end

  def terminar_evento
    @estado_evento = :terminado

    @historia << @evento_actual if 0 != @evento_actual.length
  end

  def persona_se_movio (persona, desde_x, desde_y, hasta_x, hasta_y)
    if :comenzado == @estado_evento
      accion_evento = Array.new
      accion_evento << :persona
      accion_evento << persona
      accion_evento << desde_x
      accion_evento << desde_y
      accion_evento << hasta_x
      accion_evento << hasta_y

      @evento_actual << accion_evento
    end
  end

  def caja_se_movio (caja, desde_x, desde_y, hasta_x, hasta_y)
    if :comenzado == @estado_evento
      accion_evento = Array.new
      accion_evento << :caja
      accion_evento << caja
      accion_evento << desde_x
      accion_evento << desde_y
      accion_evento << hasta_x
      accion_evento << hasta_y

      @evento_actual << accion_evento
    end
  end

  def deshacer
    evento = @historia.pop
    if nil != evento
      evento.each do |accion_evento|
        quien = accion_evento[0]
        item = accion_evento[1]
        desde_x = accion_evento[2]
        desde_y = accion_evento[3]
        case accion_evento[0]
        when :persona
          item.set_posicion(desde_x, desde_y)
          item.cambiar_cantidad_movimientos(item.get_cantidad_movimientos - 1)
        when :caja
          item.set_posicion(desde_x, desde_y)
        end
      end
    end
  end
end
