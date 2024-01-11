class Place < ApplicationRecord
  belongs_to :customer
  has_many :event_places
  has_many :events, through: :event_places
end
