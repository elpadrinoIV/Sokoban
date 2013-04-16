# To change this template, choose Tools | Templates
# and open the template in the editor.

require 'caja'
require 'destino'
require 'escenario'
require 'item'
require 'pared'
require 'persona'

class EscenarioLoader
  def initialize
    
  end

  def cargar_escenario_desde_archivo archivo_escenario
    lineas = IO.readlines(archivo_escenario)
    escenario = cargar_escenario(lineas)
    escenario
  end

  def cargar_escenario lineas
    escenario = Escenario.new
    fila = 0
    lineas.each do |linea|
      linea = strip_comentarios linea
      if !linea_en_blanco?(linea)
        fila = fila + 1
        
        (1..linea.length).each do |columna|
          # puts linea[columna - 1]
          case linea[columna - 1]
          when '#'  
            pared = Pared.new
            pared.set_posicion(columna, fila)
            escenario.agregar_pared(pared)
          when '.'
            target = Destino.new
            target.set_posicion(columna, fila)
            escenario.agregar_destino(target)
          when '$'
            caja = Caja.new
            caja.set_posicion(columna, fila)
            caja.set_escenario(escenario)
            escenario.agregar_caja(caja)
          when '@'
            persona = Persona.new
            persona.set_posicion(columna, fila)
            persona.set_escenario(escenario)
            escenario.agregar_persona(persona)
          when '*'
            target = Destino.new
            target.set_posicion(columna, fila)
            escenario.agregar_destino(target)

            caja = Caja.new
            caja.set_posicion(columna, fila)
            caja.set_escenario(escenario)
            escenario.agregar_caja(caja)
          when '+'
            target = Destino.new
            target.set_posicion(fila, columna)
            escenario.agregar_destino(target)

            persona = Persona.new
            persona.set_posicion(fila, columna)
            persona.set_escenario(escenario)
            escenario.agregar_persona(persona)
          end
        end
      end
    end

    escenario
  end

  private
  def linea_en_blanco? linea
    (linea.strip).empty?
  end

  def strip_comentarios linea
    linea = linea.split(';')[0]
    linea
  end


end
