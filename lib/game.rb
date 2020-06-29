require_relative 'display.rb'

class Game
  include Display
  attr_accessor :player1, :player2

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
  end
end
