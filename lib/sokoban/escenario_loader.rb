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
    paredes = Array.new
    destinos = Array.new
    cajas = Array.new
    lineas.each do |linea|
      linea = strip_comentarios linea
      if !linea_en_blanco?(linea)
        linea.strip!
        if (linea =~ /(WALL|BOX|TARGET|GUY)\s*:\s*x\s*=\s*([0-9]+)\s*,\s*y\s*=\s*([0-9]+)/)
          elemento = $1

          x = $2.to_i
          y = $3.to_i
          case elemento
          when "WALL"
            pared = Pared.new
            pared.set_posicion(x, y)
            paredes.push pared
          when "BOX"
            caja = Caja.new
            caja.set_posicion(x, y)
            caja.set_escenario(escenario)
            cajas.push caja
          when "TARGET"
            target = Destino.new
            target.set_posicion(x, y)
            destinos.push target
          end
        end
      end
    end

    # pongo primero las paredes
    paredes.each do |pared|
      escenario.agregar_pared(pared)
    end

    # después los destinos
    destinos.each do |destino|
      escenario.agregar_destino(destino)
    end

    # después las cajas
    cajas.each do |caja|
      escenario.agregar_caja(caja)
    end
    
    escenario
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
