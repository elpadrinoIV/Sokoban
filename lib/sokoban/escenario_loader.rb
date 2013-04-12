# To change this template, choose Tools | Templates
# and open the template in the editor.

require 'Escenario'
require 'Caja'
require 'Pared'
require 'Persona'
require 'Item'


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
    lineas.each do |linea|
      linea = strip_comentarios linea
      if !linea_en_blanco?(linea)
        linea.strip!
        if (linea =~ /(WALL|BOX|TARGET|GUY)\s*:\s*x\s*=\s*([0-9]+)\s*,\s*y\s*=\s*([0-9]+)/)
          elemento = $1
          x = $2
          y = $3
          case elemento
          when "WALL"
            pared = Pared.new
            pared.set_posicion(x, y)
            escenario.agregar_item(pared)
          when "BOX"
            caja = Caja.new
            pared.set_posicion(x, y)
            escenario.agregar_item(caja)
            caja.set_escenario(escenario)
          when "TARGET"

          end
        end
      end
    end
  end

  private
  def linea_en_blanco? linea
    (linea.strip).empty?
  end

  def strip_comentarios linea
    linea = linea.split('#')[0]
    linea
  end


end
