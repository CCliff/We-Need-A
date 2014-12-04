class User < ActiveRecord::Base
  has_many :teams
  has_many :requests
  has_many :games, through: :requests, as: :requested_games
  has_many :invites
  has_many :games, through: :invites, as: :game_invites

  scope :sport, proc { |sport|
    sport ? where('sports like ?', "%#{sport}%") : all
  }

  scope :location, proc { |location|
    location ? where('locations like ?', "#{location}") : all
  }

end