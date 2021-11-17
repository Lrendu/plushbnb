class PlushesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @plushes = Plush.all
  end

def show
  @plush = Plush.find(params[:id])
  @rental = Rental.new
end

def new
  @plush = Plush.new
  authorize @plush
end

  def create
  @plush = Plush.new(plush_params)
  authorize @plush
  @plush.owner_id = User.last.id
    if @plush.save
      redirect_to plush_path(@plush)
    else
      render :new
    end
  end

  def destroy
    @plush = Plush.find(params[:id])
    @plush.destroy
    redirect_to plushes_path
  end


  private

  def plush_params
    params.require(:plush).permit(:name, :description, :price, :photo)
  end
end
