class AnnoncesController < ApplicationController
  before_action :set_annonce, only: [ :show, :destroy ]

  def index
    @annonces = Annonce.all
    @search_params = {
      address: params.fetch(:search, {})[:query_address].to_s
    }

    @annonces = @annonces.select { |annonce| annonce.distance_from(@search_params[:address]) <= 5 } unless @search_params[:address] == ""
    @annonces = @annonces.sort_by { |annonce| annonce.created_at }.reverse
    @annonces = @annonces.first(6)
  end

  def show
  end

  def new
    @annonce = Annonce.new
  end

  def create
    @user = current_user
    @annonce = @user.annonces.build(annonce_params)
    if @annonce.save
      redirect_to @annonce
    else
      render :new
    end
  end

  def destroy
  end

private

  def annonce_params
   params.require(:annonce).permit(:title, :price, :street_number, :route, :locality, :administrative_area_level_1, :postal_code, :country, :photo, :photo_cache, :description)
  end

  def set_annonce
    @annonce = Annonce.find(params[:id])
  end

end
