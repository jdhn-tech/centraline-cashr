namespace :admin do
  desc "Generates test data for demo"
  task generate_test_data: :environment do
    # Table de livraison
    Table.create(:id => 0, :table_number => Table.count, :occupied => false)

  	# Categories
  	Category.create(:id => 1, :code => 'BS', :name => 'boisson soft', :vat => 5.5)
  	Category.create(:id => 2, :code => 'BA', :name => 'boisson alcoolisée', :vat => 10)
  	Category.create(:id => 3, :code => 'AP', :name => 'apéritif', :vat => 10)
  	Category.create(:id => 4, :code => 'EN', :name => 'entrée', :vat => 10)
  	Category.create(:id => 5, :code => 'PS', :name => 'plat chaud', :vat => 10)
  	Category.create(:id => 6, :code => 'PF', :name => 'plat froid', :vat => 10)
    Category.create(:id => 7, :code => 'DE', :name => 'dessert', :vat => 10)
    Category.create(:id => 8, :code => 'ME', :name => 'menu', :vat => 10)

  	# Articles
  	Article.create(:id => 1, :code => 'BS01', :name => 'CocaCola 50ml', :price => 200, :category_id => 1)
  	Article.create(:id => 2, :code => 'BA01', :name => 'Saint Emilion 50ml', :price => 300, :category_id => 2)
  	Article.create(:id => 3, :code => 'AP01', :name => 'Kir Royal 50ml', :price => 250, :category_id => 3)
  	Article.create(:id => 4, :code => 'EN01', :name => 'Saumon Fumé', :price => 800, :category_id => 4)
  	Article.create(:id => 5, :code => 'PS01', :name => 'Steak Frites', :price => 1200, :category_id => 5)
  	Article.create(:id => 6, :code => 'PS02', :name => 'Croque Monsieur', :price => 1200, :category_id => 5)
  	Article.create(:id => 7, :code => 'PF01', :name => 'Salade de Carottes', :price => 1200, :category_id => 6)
  	Article.create(:id => 8, :code => 'DE01', :name => 'Tiramisu', :price => 550, :category_id => 7)

    # menuSections
    MenuSection.create(:id => 1, :name => "Entrée")
    MenuSection.create(:id => 2, :name => "Plat")
    MenuSection.create(:id => 3, :name => "Dessert")
    MenuSection.create(:id => 4, :name => "Boisson")

  	# Menus
  	Menu.create(:id => 1, :code => 'ME01', :name => 'Menu 1', :price => 950, :category_id => 8, :article_ids => ["1","6"])
      MenuArticle.create(:id => 1, :menu_id => 1, :menu_section_id => 4, :article_id => 1, :choosable => false)
      MenuArticle.create(:id => 2, :menu_id => 1, :menu_section_id => 2, :article_id => 6, :choosable => false)
    Menu.create(:id => 2, :code => 'ME02', :name => 'Menu 2', :price => 1550, :category_id => 8, :article_ids => ["1","6","8"])
      MenuArticle.create(:id => 3, :menu_id => 2, :menu_section_id => 4, :article_id => 1, :choosable => false)
      MenuArticle.create(:id => 4, :menu_id => 2, :menu_section_id => 2, :article_id => 6, :choosable => false)
      MenuArticle.create(:id => 5, :menu_id => 2, :menu_section_id => 3, :article_id => 8, :choosable => false)
    Menu.create(:id => 3, :code => 'ME03', :name => 'Menu 3', :price => 1550, :category_id => 8, :article_ids => ["1","5","8"])
      MenuArticle.create(:id => 6, :menu_id => 3, :menu_section_id => 4, :article_id => 1, :choosable => false)
      MenuArticle.create(:id => 7, :menu_id => 3, :menu_section_id => 2, :article_id => 5, :choosable => false)
      MenuArticle.create(:id => 8, :menu_id => 3, :menu_section_id => 3, :article_id => 8, :choosable => false)
    Menu.create(:id => 4, :code => 'ME04', :name => 'Menu 4', :price => 1750, :category_id => 8, :article_ids => ["2","5","7","8"])
      MenuArticle.create(:id => 9, :menu_id => 4, :menu_section_id => 4, :article_id => 2, :choosable => false)
      MenuArticle.create(:id => 10, :menu_id => 4, :menu_section_id => 2, :article_id => 5, :choosable => false)
      MenuArticle.create(:id => 11, :menu_id => 4, :menu_section_id => 2, :article_id => 7, :choosable => false)
      MenuArticle.create(:id => 12, :menu_id => 4, :menu_section_id => 3, :article_id => 8, :choosable => false)

  	# Paiements
    Payment.create(:id => 1, :name => 'Espèces')
    Payment.create(:id => 2, :name => 'Ticket Restaurant')
    Payment.create(:id => 3, :name => 'Carte Bleue')
    Payment.create(:id => 4, :name => 'Carte Restaurant')
    Payment.create(:id => 5, :name => 'Chèque bancaire')
  end

end
