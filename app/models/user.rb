class User < ActiveRecord::Base
  has_many :teams
  has_many :requests
  has_many :games, through: :requests, as: :requested_games
  has_many :invites
  has_many :games, through: :invites, as: :game_invites

  #these procs allow one, many, or nil values to be entered to create a WHERE clause
  # Procs were chosen over lambdas to allow the nil value
  scope :sport, proc { |sport|
    sport ? where('sports like ?', "%#{sport}%") : all
  }

  scope :location, proc { |location|
    location ? where('locations like ?', "#{location}") : all
  }

  # usernames must be unique
  validates :username, uniqueness: true
  include BCrypt

  def password
    # shows the decrypted password
    Password.new(self.hashed_password)
  end

  def password=(new_password)
      # create a decrypted password and store it in the database
      self.hashed_password = Password.create(new_password)
  end

end