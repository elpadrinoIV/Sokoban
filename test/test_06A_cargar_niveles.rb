require File.dirname(__FILE__) + '/helper.rb'

require 'escenario_loader'
require 'persona'

class TestCargarNiveles < Test::Unit::TestCase
  def setup
    @escenario_loader = EscenarioLoader.new
  end
  
  def test_06a01_carga_sencilla
    # ####
    # #. #
    # #$@#
    #  ###

    archivo = File.dirname(__FILE__) + '/esquema_test_06A01_sencillo.txt'
    escenario = @escenario_loader.cargar_escenario_desde_archivo(archivo)

    check_primeras_pruebas escenario
  end

  def test_06a02_carga_sencilla_trailing_space
    # ####
    # #. #
    # #$@#
    #  ###

    archivo = File.dirname(__FILE__) + '/esquema_test_06A02_sencillo_trailing_space.txt'
    escenario = @escenario_loader.cargar_escenario_desde_archivo(archivo)

    check_primeras_pruebas escenario
  end

  def test_06a03_carga_sencilla_espacios_antes_y_despues
    # ####
    # #. #
    # #$@#
    #  ###

    archivo = File.dirname(__FILE__) + '/esquema_test_06A02_sencillo_espacios_antes_y_despues.txt'
    escenario = @escenario_loader.cargar_escenario_desde_archivo(archivo)

    check_primeras_pruebas escenario
  end

  def test_06a04_carga_compleja
    #    ### ##
    #   #. ###*#
    #   #$ $ + #
    #    ######
    archivo = File.dirname(__FILE__) + '/esquema_test_06A04_complejo.txt'
    escenario = @escenario_loader.cargar_escenario_desde_archivo(archivo)


    pared_en_2_1 = false
    pared_en_3_1 = false
    pared_en_4_1 = false
    pared_en_6_1 = false
    pared_en_7_1 = false

    pared_en_1_2 = false
    pared_en_4_2 = false
    pared_en_5_2 = false
    pared_en_6_2 = false
    pared_en_8_2 = false

    pared_en_1_3 = false
    pared_en_8_3 = false

    pared_en_2_4 = false
    pared_en_3_4 = false
    pared_en_4_4 = false
    pared_en_5_4 = false
    pared_en_6_4 = false
    pared_en_7_4 = false

    destino_en_2_2 = false
    destino_en_7_2 = false
    destino_en_6_3 = false

    caja_en_7_2 = false
    caja_en_2_3 = false
    caja_en_4_3 = false

    persona_en_6_3 = false

    escenario.get_paredes.each do |pared|
      if 2 == pared.get_x && 1 == pared.get_y
        pared_en_2_1 = true
      elsif 3 == pared.get_x && 1 == pared.get_y
        pared_en_3_1 = true
      elsif 4 == pared.get_x && 1 == pared.get_y
        pared_en_4_1 = true
      elsif 6 == pared.get_x && 1 == pared.get_y
        pared_en_6_1 = true
       elsif 7 == pared.get_x && 1 == pared.get_y
        pared_en_7_1 = true
      elsif 1 == pared.get_x && 2 == pared.get_y
        pared_en_1_2 = true
      elsif 4 == pared.get_x && 2 == pared.get_y
        pared_en_4_2 = true
      elsif 5 == pared.get_x && 2 == pared.get_y
        pared_en_5_2 = true
      elsif 6 == pared.get_x && 2 == pared.get_y
        pared_en_6_2 = true
      elsif 8 == pared.get_x && 2 == pared.get_y
        pared_en_8_2 = true
      elsif 1 == pared.get_x && 3 == pared.get_y
        pared_en_1_3 = true
      elsif 8 == pared.get_x && 3 == pared.get_y
        pared_en_8_3 = true
      elsif 2 == pared.get_x && 4 == pared.get_y
        pared_en_2_4 = true
      elsif 3 == pared.get_x && 4 == pared.get_y
        pared_en_3_4 = true
      elsif 4 == pared.get_x && 4 == pared.get_y
        pared_en_4_4 = true
      elsif 5 == pared.get_x && 4 == pared.get_y
        pared_en_5_4 = true
      elsif 6 == pared.get_x && 4 == pared.get_y
        pared_en_6_4 = true
      elsif 7 == pared.get_x && 4 == pared.get_y
        pared_en_7_4 = true
      end
    end

    paredes_bien = pared_en_2_1 && pared_en_3_1 && pared_en_4_1 && pared_en_6_1 && pared_en_7_1 &&
                   pared_en_1_2 && pared_en_4_2 && pared_en_5_2 && pared_en_6_2 && pared_en_8_2 &&
                   pared_en_1_3 && pared_en_8_3 &&
                   pared_en_2_4 && pared_en_3_4 && pared_en_4_4 && pared_en_5_4 && pared_en_6_4 && pared_en_7_4

    paredes_bien = paredes_bien && (18 == escenario.get_paredes.length)

    escenario.get_destinos.each do |destino|
      if 2 == destino.get_x && 2 == destino.get_y
        destino_en_2_2 = true
      elsif 7 == destino.get_x && 2 == destino.get_y
        destino_en_7_2 = true
      elsif 6 == destino.get_x && 3 == destino.get_y
        destino_en_6_3 = true
      end
    end

    destinos_bien = destino_en_2_2 && destino_en_7_2 && destino_en_6_3 && (3 == escenario.get_destinos.length)

    escenario.get_cajas.each do |caja|
      if 7 == caja.get_x && 2 == caja.get_y
        caja_en_7_2 = true
      elsif 2 == caja.get_x && 3 == caja.get_y
        caja_en_2_3 = true
      elsif 4 == caja.get_x && 3 == caja.get_y
        caja_en_4_3 = true
      end
    end

    cajas_bien = caja_en_7_2 && caja_en_2_3 && caja_en_4_3 && (3 == escenario.get_cajas.length)

    persona_en_6_3 = (6 == escenario.get_persona.get_x && 3 == escenario.get_persona.get_y)

    assert_equal(true, paredes_bien, "Mal la carga de paredes a partir del archivo")
    assert_equal(true, destinos_bien, "Mal la carga de destinos a partir del archivo")
    assert_equal(true, cajas_bien, "Mal la carga de cajas a partir del archivo")
    assert_equal(true, persona_en_6_3, "Mal la carga de la persona a partir del archivo")
    assert_equal(8, escenario.get_ancho, "Mal el ancho")
    assert_equal(4, escenario.get_alto, "Mal el alto")
  end

  # como todos los primeros 3 tests se hace todo igual salvo el archivo que se carga, lo agrupo aca
  def check_primeras_pruebas escenario
    # ####
    # #. #
    # #$@#
    # ####
    
    pared_en_1_1 = false
    pared_en_2_1 = false
    pared_en_3_1 = false
    pared_en_4_1 = false
    
    pared_en_1_2 = false
    pared_en_4_2 = false

    pared_en_1_3 = false
    pared_en_4_3 = false

    pared_en_2_4 = false
    pared_en_3_4 = false
    pared_en_4_4 = false

    destino_en_2_2 = false
    caja_en_2_3 = false
    persona_en_3_3 = false

    escenario.get_paredes.each do |pared|
      if 1 == pared.get_x && 1 == pared.get_y
        pared_en_1_1 = true
      elsif 2 == pared.get_x && 1 == pared.get_y
        pared_en_2_1 = true
      elsif 3 == pared.get_x && 1 == pared.get_y
        pared_en_3_1 = true
      elsif 4 == pared.get_x && 1 == pared.get_y
        pared_en_4_1 = true
      elsif 1 == pared.get_x && 2 == pared.get_y
        pared_en_1_2 = true
      elsif 4 == pared.get_x && 2 == pared.get_y
        pared_en_4_2 = true
      elsif 1 == pared.get_x && 3 == pared.get_y
        pared_en_1_3 = true
      elsif 4 == pared.get_x && 3 == pared.get_y
        pared_en_4_3 = true
      elsif 2 == pared.get_x && 4 == pared.get_y
        pared_en_2_4 = true
      elsif 3 == pared.get_x && 4 == pared.get_y
        pared_en_3_4 = true
      elsif 4 == pared.get_x && 4 == pared.get_y
        pared_en_4_4 = true
      end
    end

    paredes_bien = pared_en_1_1 && pared_en_2_1 && pared_en_3_1 && pared_en_4_1
                   pared_en_1_2 && pared_en_4_2 && pared_en_1_3 && pared_en_4_3 &&
                                   pared_en_2_4 && pared_en_3_4 && pared_en_4_4

    paredes_bien = paredes_bien && (11 == escenario.get_paredes.length)
    
    escenario.get_destinos.each do |destino|
      if 2 == destino.get_x && 2 == destino.get_y
        destino_en_2_2 = true
      end
    end

    destinos_bien = destino_en_2_2 && (1 == escenario.get_destinos.length)

    escenario.get_cajas.each do |caja|
      if 2 == caja.get_x && 3 == caja.get_y
        caja_en_2_3 = true
      end
    end

    cajas_bien = caja_en_2_3 && (1 == escenario.get_cajas.length)

    persona_en_3_3 = (3 == escenario.get_persona.get_x && 3 == escenario.get_persona.get_y)

    assert_equal(true, paredes_bien, "Mal la carga de paredes a partir del archivo")
    assert_equal(true, destinos_bien, "Mal la carga de destinos a partir del archivo")
    assert_equal(true, cajas_bien, "Mal la carga de cajas a partir del archivo")
    assert_equal(true, persona_en_3_3, "Mal la carga de la persona a partir del archivo")
    assert_equal(4, escenario.get_ancho, "Mal el ancho")
    assert_equal(4, escenario.get_alto, "Mal el alto")
  end


end
  