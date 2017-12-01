class NoteEntry < ApplicationRecord
	belongs_to	:note
	validates_presence_of :article_id, :unless => :menu_id?
	validates_presence_of :menu_id, :unless => :article_id?

	def getCode
		return self.menu_id ? Menu.find(self.menu_id).code : Article.find(self.article_id).code
	end
	def getName
		return self.menu_id ? Menu.find(self.menu_id).name : Article.find(self.article_id).name
	end
end
