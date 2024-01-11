class Event < ApplicationRecord
  belongs_to :customer
  has_many :event_places
  has_many :places, through: :event_places

end
