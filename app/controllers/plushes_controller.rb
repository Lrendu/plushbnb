class PlushesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index

    if params[:query].present?
      sql_query = "name @@ :query OR description @@ :query"
      @plushes = Plush.where(sql_query, query: "%#{params[:query]}%")
    else
      @plushes = Plush.all
    end

    @markers = @plushes.geocoded.map do |plush|
    {
      lat: plush.latitude,
      lng: plush.longitude,
      info_window: render_to_string(partial: "info_window", locals: { plush: plush })
    }
    end
  end


  def show
    @plush = Plush.find(params[:id])
    authorize @plush
    @rental = Rental.new
    @rentals = @plush.rentals
    @rentals_dates = @rentals.map do |rental|
      {
        from: rental.date,
        to:   rental.date
      }
    end
  end

  def new
    @plush = Plush.new
    authorize @plush
  end

  def create
  @plush = Plush.new(plush_params)
  authorize @plush
  @plush.owner_id = current_user.id
    if @plush.save
      redirect_to plush_path(@plush)
    else
      render :new
    end
  end

  def destroy
    @plush = Plush.find(params[:id])
    authorize @plush
    if @plush.rentals.any?
      flash[:alert] = "Cette peluche est déjà louée, elle ne peut pas être supprimée"
    else
      @plush.destroy
    end
    redirect_to users_user_profile_path(@plush)
  end

  private

  def plush_params
    params.require(:plush).permit(:name, :description, :price, :photo, :owner, :address, :color, :size)
  end
end
