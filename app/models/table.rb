class Table < ApplicationRecord

	validates :table_number, presence: true, uniqueness: true

	attr_accessor :table_number, :table_capacity, :floor_number
end