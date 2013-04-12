require 'test/unit'
# require File.dirname(__FILE__) + '/../lib/sokoban'
%w[sokoban].each{ |libreria|
  $LOAD_PATH.unshift(File.join(File.dirname(__FILE__), "../lib/#{libreria}"))
}
