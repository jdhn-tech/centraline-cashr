namespace :admin do
  desc "Generates test data for demo"
  task generate_test_data: :environment do
  	# Categories
  	Category.create(:id => 1, :code => 'BS', :name => 'boisson soft')
  	Category.create(:id => 2, :code => 'BA', :name => 'boisson alcoolisée')
  	Category.create(:id => 3, :code => 'AP', :name => 'apéritif')
  	Category.create(:id => 4, :code => 'EN', :name => 'entrée')
  	Category.create(:id => 5, :code => 'PS', :name => 'plat chaud')
  	Category.create(:id => 6, :code => 'PF', :name => 'plat froid')
  	Category.create(:id => 7, :code => 'DE', :name => 'dessert')
  	Category.create(:id => 8, :code => 'MA', :name => 'menu matin')
  	Category.create(:id => 9, :code => 'MI', :name => 'menu midi')
  	Category.create(:id => 10, :code => 'MS', :name => 'menu soir')

  	# Articles
  	Article.create(:id => 1, :code => 'BS01', :name => 'CocaCola 50ml', :price => 200, :category_ids => ["1"])
  	Article.create(:id => 2, :code => 'BA01', :name => 'Saint Emilion 50ml', :price => 300, :category_ids => ["2"])
  	Article.create(:id => 3, :code => 'AP01', :name => 'Kir Royal 50ml', :price => 250, :category_ids => ["3"])
  	Article.create(:id => 4, :code => 'EN01', :name => 'Saumon Fumé', :price => 800, :category_ids => ["4"])
  	Article.create(:id => 5, :code => 'PS01', :name => 'Steak Frites', :price => 1200, :category_ids => ["5"])
  	Article.create(:id => 6, :code => 'PS02', :name => 'Croque Monsieur', :price => 1200, :category_ids => ["5"])
  	Article.create(:id => 7, :code => 'PF01', :name => 'Salade de Carottes', :price => 1200, :category_ids => ["6"])
  	Article.create(:id => 8, :code => 'DE01', :name => 'Tiramisu', :price => 550, :category_ids => ["7"])

  	# Menus
  	Menu.create(:id => 1, :code => 'MA01', :name => 'Menu du Matin', :price => 950, :category_id => 8, :article_ids => ["6"])
  	Menu.create(:id => 2, :code => 'MI01', :name => 'Menu du Midi', :price => 1550, :category_id => 9, :article_ids => ["1", "2", "3", "4", "5", "6", "7", "8"])
  	Menu.create(:id => 3, :code => 'MS01', :name => 'Menu du Soir', :price => 1750, :category_id => 10, :article_ids => ["1", "2", "3", "4", "5", "6", "7", "8"])

  	# 
  end

end
