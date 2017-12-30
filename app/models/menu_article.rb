class MenuArticle < ApplicationRecord
	belongs_to :menu
	belongs_to :article
	belongs_to :menu_section
	after_initialize :init

	def init
		self.choosable ||= false
	end
end
