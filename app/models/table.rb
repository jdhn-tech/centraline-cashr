class Table < ApplicationRecord

	validates :number, presence: true, uniqueness: true
	validates :name, presence: true

	attr_accessor :table_number, :table_capacity, :floor_number

	def init

	end
end