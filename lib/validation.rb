# Module with all validation methods
module Validation
  ARRAY_POSITIONS = [1, 2, 3, 4, 5, 6, 7, 8, 9].freeze

  def pick_valid?(pick)
    ARRAY_POSITIONS.include?(pick)
  end

  def not_picked?(pick)
    grid.include?(pick)
  end
end
