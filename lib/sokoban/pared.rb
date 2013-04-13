require 'item'

class Pared < Item

  def initialize
  end

  def ocupa_lugar?
    true
  end

  def get_imagen
    'W'
  end

  def movible?
    false
  end
end
