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
    min_fila = 1000000
    min_col = 1000000
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

            min_col = columna if columna < min_col
            min_fila = fila if fila < min_fila
          when '.'
            target = Destino.new
            target.set_posicion(columna, fila)
            escenario.agregar_destino(target)

            min_col = columna if columna < min_col
            min_fila = fila if fila < min_fila
          when '$'
            caja = Caja.new
            caja.set_posicion(columna, fila)
            caja.set_escenario(escenario)
            escenario.agregar_caja(caja)

            min_col = columna if columna < min_col
            min_fila = fila if fila < min_fila
          when '@'
            persona = Persona.new
            persona.set_posicion(columna, fila)
            persona.set_escenario(escenario)
            escenario.agregar_persona(persona)

            min_col = columna if columna < min_col
            min_fila = fila if fila < min_fila
          when '*'
            target = Destino.new
            target.set_posicion(columna, fila)
            escenario.agregar_destino(target)

            caja = Caja.new
            caja.set_posicion(columna, fila)
            caja.set_escenario(escenario)
            escenario.agregar_caja(caja)

            min_col = columna if columna < min_col
            min_fila = fila if fila < min_fila
          when '+'
            target = Destino.new
            target.set_posicion(columna, fila)
            escenario.agregar_destino(target)
            
            persona = Persona.new
            persona.set_posicion(columna, fila)
            persona.set_escenario(escenario)
            escenario.agregar_persona(persona)

            min_col = columna if columna < min_col
            min_fila = fila if fila < min_fila
          end
        end
      end
    end

    shift_escenario escenario, min_fila, min_col
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

  def shift_escenario escenario, min_fila, min_col
    shift_x = min_col - 1
    shift_y = min_fila - 1

    if 0 != shift_x || 0 != shift_y
      escenario.get_paredes.each do |pared|
        pared.set_posicion(pared.get_x - shift_x, pared.get_y - shift_y)
      end

      escenario.get_cajas.each do |caja|
        caja.set_posicion(caja.get_x - shift_x, caja.get_y - shift_y)
      end

      escenario.get_destinos.each do |destino|
        destino.set_posicion(destino.get_x - shift_x, destino.get_y - shift_y)
      end

      escenario.get_persona.set_posicion(escenario.get_persona.get_x - shift_x, escenario.get_persona.get_y - shift_y)

    end
  end


end
