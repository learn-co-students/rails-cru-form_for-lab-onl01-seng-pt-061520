class Artist < ApplicationRecord
  has_many :songs
  has_many :genres, through: :songs

  def to_s
    name
  end
end
