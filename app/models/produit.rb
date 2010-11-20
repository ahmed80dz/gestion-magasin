class Produit < ActiveRecord::Base
  validates_presence_of :nom
  scope :tout,:order => "created_at DESC"
  require 'csv'
  # def self.tout(page)
  #   @posts = Produit.paginate :page =>page, :per_page => 7, :order => 'created_at DESC'
  # end
  def self.search(search)
    if search
      where('nom LIKE ?', "%#{search}%").order("created_at DESC")
    else
      tout
    end
  end
  def self.create_by_csv(file)
    n=0
    CSV.foreach(file, :col_sep =>';') do |row|
      c=Produit.new
      n=n+1
      c.ref=row[1]
      c.nom=row[5]
      c.prix=row[8]
      c.save
    end
    return n
  end
end
