# frozen_string_literal: true

# Player class that will hold info for each of two human players
class Player
  attr_reader :name, :marker, :score

  def initialize(name, marker)
    @name = name
    @marker = marker
    @score = 0
  end

  def increment_score
    @score += 1
  end
end
