namespace :db do
  desc "Erase and fill database"
  task :populate => :environment do
   # require 'populator'
   # require 'faker'

    Produit(&:delete_all)

    Produit.populate 10..100 do |product|
      product.nom = Populator.words(1..5).titleize
      product.prix = [4.99, 19.95, 100]
      product.created_at = 2.years.ago..Time.now
    end
  end
end
