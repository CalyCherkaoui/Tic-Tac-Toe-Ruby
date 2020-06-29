# inputs : player name(string) ** outputs:
class Player
  POSSIBILITIES = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]].freeze
  attr_accessor :name
  attr_reader :picks_array, :totem

  def initialize(totem, name = '', picks_array = [])
    @name = name
    @picks_array = picks_array
    @totem = totem
  end

  def winner?
    result = false
    POSSIBILITIES.each do |array|
      result ||= array.all? { |elem| @picks_array.include?(elem) }
    end
    result
  end
end
