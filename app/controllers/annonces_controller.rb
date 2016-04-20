class AnnoncesController < ApplicationController
  before_action :set_annonce, only: [ :show, :destroy ]

  def index
    @annonces = Annonce.all
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
   params.require(:annonce).permit(:title, :price, :locality, :photo, :photo_cache)
  end

  def set_annonce
    @annonce = Annonce.find(params[:id])
  end

end
