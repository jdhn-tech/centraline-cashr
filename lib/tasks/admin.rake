namespace :admin do
  desc "Generates test data for demo"
  task generate_test_data: :environment do
    # Table de livraison
    Table.create(:id => 0, :table_number => Table.count, :occupied => false)

  	# Categories
  	Category.create(:code => 'BS', :name => 'boisson soft', :vat => 5.5)
  	Category.create(:code => 'BA', :name => 'boisson alcoolisée', :vat => 10)
  	Category.create(:code => 'AP', :name => 'apéritif', :vat => 10)
  	Category.create(:code => 'EN', :name => 'entrée', :vat => 10)
  	Category.create(:code => 'PS', :name => 'plat chaud', :vat => 10)
  	Category.create(:code => 'PF', :name => 'plat froid', :vat => 10)
    Category.create(:code => 'DE', :name => 'dessert', :vat => 10)
    Category.create(:code => 'ME', :name => 'menu', :vat => 10)

  	# Articles
  	Article.create(:code => 'BS01', :name => 'CocaCola 50ml', :price => 200, :category_id => 1)
  	Article.create(:code => 'BA01', :name => 'Saint Emilion 50ml', :price => 300, :category_id => 2)
  	Article.create(:code => 'AP01', :name => 'Kir Royal 50ml', :price => 250, :category_id => 3)
  	Article.create(:code => 'EN01', :name => 'Saumon Fumé', :price => 800, :category_id => 4)
  	Article.create(:code => 'PS01', :name => 'Steak Frites', :price => 1200, :category_id => 5)
  	Article.create(:code => 'PS02', :name => 'Croque Monsieur', :price => 1200, :category_id => 5)
  	Article.create(:code => 'PF01', :name => 'Salade de Carottes', :price => 1200, :category_id => 6)
  	Article.create(:code => 'DE01', :name => 'Tiramisu', :price => 550, :category_id => 7)

    # menuSections
    MenuSection.create(:name => "Entrée")
    MenuSection.create(:name => "Plat")
    MenuSection.create(:name => "Dessert")
    MenuSection.create(:name => "Boisson")

  	# Menus
  	Menu.create(:code => 'ME01', :name => 'Menu 1', :price => 950, :category_id => 8, :article_ids => ["1","6"])
      MenuArticle.create(:menu_id => 1, :menu_section_id => 4, :article_id => 1, :choosable => false)
      MenuArticle.create(:menu_id => 1, :menu_section_id => 2, :article_id => 6, :choosable => false)
    Menu.create(:code => 'ME02', :name => 'Menu 2', :price => 1550, :category_id => 8, :article_ids => ["1","6","8"])
      MenuArticle.create(:menu_id => 2, :menu_section_id => 4, :article_id => 1, :choosable => false)
      MenuArticle.create(:menu_id => 2, :menu_section_id => 2, :article_id => 6, :choosable => false)
      MenuArticle.create(:menu_id => 2, :menu_section_id => 3, :article_id => 8, :choosable => false)
    Menu.create(:code => 'ME03', :name => 'Menu 3', :price => 1550, :category_id => 8, :article_ids => ["1","5","8"])
      MenuArticle.create(:menu_id => 3, :menu_section_id => 4, :article_id => 1, :choosable => false)
      MenuArticle.create(:menu_id => 3, :menu_section_id => 2, :article_id => 5, :choosable => false)
      MenuArticle.create(:menu_id => 3, :menu_section_id => 3, :article_id => 8, :choosable => false)
    Menu.create(:code => 'ME04', :name => 'Menu 4', :price => 1750, :category_id => 8, :article_ids => ["2","5","7","8"])
      MenuArticle.create(:menu_id => 4, :menu_section_id => 4, :article_id => 2, :choosable => false)
      MenuArticle.create(:menu_id => 4, :menu_section_id => 2, :article_id => 5, :choosable => false)
      MenuArticle.create(:menu_id => 4, :menu_section_id => 2, :article_id => 7, :choosable => false)
      MenuArticle.create(:menu_id => 4, :menu_section_id => 3, :article_id => 8, :choosable => false)

  	# Paiements
    Payment.create(:name => 'Espèces')
    Payment.create(:name => 'Ticket Restaurant')
    Payment.create(:name => 'Carte Bleue')
    Payment.create(:name => 'Carte Restaurant')
    Payment.create(:name => 'Chèque bancaire')
  end

end
