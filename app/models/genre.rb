class Genre < ApplicationRecord
  has_many :songs
  has_many :artists, through: :songs

  def to_s
    name
  end
end
