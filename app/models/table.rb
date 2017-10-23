class Table < ApplicationRecord

	validates :number, presence: true, uniqueness: true
	validates :name, presence: true

end