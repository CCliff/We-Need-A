class Game < ActiveRecord::Base
  belongs_to :team
  has_many :invites
  has_many :players, through: :invites
  has_many :requests
  has_many :players, through: :requests

  #these procs allow one, many, or nil values to be entered to create a WHERE clause
  # Procs were chosen over lambdas to allow the nil value
  scope :location, proc { |location|
    location ? where(location: location) : all
  }
  scope :date, proc { |dates|
    dates ? where(date: dates) : all
  }
  scope :sport, proc { |sports|
    sports ? joins(:team).where('teams.sport' => sports) : all
  }

end