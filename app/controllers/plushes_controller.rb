class PlushesController < ApplicationController

def index
  @plushes = Plush.all
end

def show
  @plush = Plush.find(params[:id])
end

def new
  @plush = Plush.new
end

  def create
  @plush = Plush.new(plush_params)
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
    redirect_to plush_path(@plushes)
  end


  private

  def plush_params
    params.require(:plush).permit(:name, :description, :price, :photo)
  end
end
