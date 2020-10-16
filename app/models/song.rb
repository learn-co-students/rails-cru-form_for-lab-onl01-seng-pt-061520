class Song < ApplicationRecord
  belongs_to :artist
  belongs_to :genre

  def to_s
    name
  end
end
