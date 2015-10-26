class Restaurant < ActiveRecord::Base
belongs_to :cuisine_type
has_many :reservations

#validates :name, :capacity, presence: true

#There is a way to do custom validations

validate :restaurant_validation

def restaurant_validation

	if name.nil?
		errors.add(:name, "Name can not be nill")
	end

	if address.nil?
		errors.add(:address, "Address can not be empty")
	end

	if capacity.nil?
		errors.add(:capacity, "Restaurant capacity can not be nill")
	end

end

end
