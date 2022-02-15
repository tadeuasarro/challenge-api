class Address < ApplicationRecord
  validates :zipcode, :street, :district, :city, :state, presence: true

  belongs_to :citizen
end
