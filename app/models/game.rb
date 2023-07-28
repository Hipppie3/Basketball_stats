class Game < ApplicationRecord
has_many :game_players
has_many :players, through: :game_players
has_many :statistics

def date=(date_str)
    # Convert the string in "month/day/year" format to a Date object
    self[:date] = Date.strptime(date_str, '%m/%d/%Y')
  rescue ArgumentError
    # Handle invalid date formats gracefully
    self[:date] = nil
  end

  # Define a getter method to return the formatted date
  def formatted_date
    self[:date].strftime('%m/%d/%Y') if self[:date]
  end
end
