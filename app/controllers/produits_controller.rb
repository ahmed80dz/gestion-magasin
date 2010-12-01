class ProduitsController < ApplicationController
  load_and_authorize_resource
  before_filter :find_produit, :only => [:show, :edit, :update, :destroy]
  # GET /produits
  # GET /produits.xml
  def index
    @produits =  Produit.search(params[:search]).paginate :page => params[:page],:per_page => 7
    @produit = Produit.new
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => Produit.all }
    end
  end

  # GET /produits/1
  # GET /produits/1.xml
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @produit }
    end
  end

  # GET /produits/new
  # GET /produits/new.xml
  def new
    @produit = Produit.new

   # respond_to do |format|
  #    format.html # new.html.erb
  #    format.xml  { render :xml => @produit }
  #  end
  end
  def liste_produits
   @title="Liste Des Produits"
   @produits = Produit.tout
   prawnto :prawn => {
      :page_size => 'A4',
      :left_margin => 50,
      :right_margin => 50,
      :top_margin => 24,
      :bottom_margin => 24}, 
      :filename=>"#{@title.gsub(' ','_')}.pdf" 
   render :layout=>false
  end

  # GET /produits/1/edit
  def edit
  end

  # POST /produits
  # POST /produits.xml
  def create
    @produit = Produit.new(params[:produit])
      if @produit.save
        @produits = Produit.tout.paginate :page => params[:page],:per_page => 7 
        flash[:notice] = 'Produit was successfully created.'
      end
  end

  # PUT /produits/1
  # PUT /produits/1.xml
  def update
    @produit.update_attributes(params[:produit])
    @produits = Produit.tout.paginate :page => params[:page],:per_page => 7 
  end

  # DELETE /produits/1
  # DELETE /produits/1.xml
  def destroy
    @produit.destroy
    flash[:notice] = "Prouduit efface."
  end

  def csv_import
    n= Produit.create_by_csv params[:dump][:file]
    flash.now[:message]="CSV Import Successfuly ,#{n} new records added to data base"
    @produit = Produit.new
    @produits = Produit.tout.paginate :page => params[:page],:per_page => 7 
    render :action => "index"
  end
  protected    
    def find_produit
      @produit = Produit.find(params[:id])
    end
end
