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
  	Category.create(:id => 8, :code => 'ME', :name => 'menu')

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
  	Menu.create(:id => 1, :code => 'ME01', :name => 'Menu 1', :price => 950, :category_id => 8, :article_ids => ["1","6"])
    Menu.create(:id => 2, :code => 'ME02', :name => 'Menu 2', :price => 1550, :category_id => 8, :article_ids => ["1","6","8"])
  	Menu.create(:id => 3, :code => 'ME03', :name => 'Menu 3', :price => 1550, :category_id => 8, :article_ids => ["1","5","8"])
    Menu.create(:id => 4, :code => 'ME04', :name => 'Menu 4', :price => 1750, :category_id => 8, :article_ids => ["2","5","7","8"])
    Menu.create(:id => 5, :code => 'ME05', :name => 'Menu 5', :price => 1750, :category_id => 8, :article_ids => ["2","5","7","8"])
    Menu.create(:id => 6, :code => 'ME06', :name => 'Menu 6', :price => 1750, :category_id => 8, :article_ids => ["2","5","7","8"])
    Menu.create(:id => 7, :code => 'ME07', :name => 'Menu 7', :price => 1750, :category_id => 8, :article_ids => ["2","5","7","8"])
    Menu.create(:id => 8, :code => 'ME08', :name => 'Menu 8', :price => 1750, :category_id => 8, :article_ids => ["2","5","7","8"])
  	Menu.create(:id => 9, :code => 'ME09', :name => 'Menu 9', :price => 1750, :category_id => 8, :article_ids => ["2","5","7","8"])

  	# Paiements
    Payment.create(:id => 1, :name => 'Espèces')
    Payment.create(:id => 2, :name => 'Ticket Restaurant')
    Payment.create(:id => 3, :name => 'Carte Bleue')
    Payment.create(:id => 4, :name => 'Carte Restaurant')
    Payment.create(:id => 5, :name => 'Chèque bancaire')
  end

end
