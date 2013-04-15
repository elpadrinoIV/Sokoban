# To change this template, choose Tools | Templates
# and open the template in the editor.

%w[sokoban].each{ |libreria|
  $LOAD_PATH.unshift(File.join(File.dirname(__FILE__), "./#{libreria}"))
}

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), "./"))

Dir['sokoban/*.rb'].each { |file|
  require file
}

escenario_loader = EscenarioLoader.new
escenario = escenario_loader.cargar_escenario_desde_archivo('../data/nivel1.txt')
escenario.dibujar
