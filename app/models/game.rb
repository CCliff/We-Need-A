class Game < ActiveRecord::Base
  belongs_to :team
  has_many :invites
  has_many :players, through: :invites
  has_many :requests
  has_many :players, through: :requests

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