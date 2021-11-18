class PlushesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index

    @plushes = Plush.all
    if params[:query].present?
      # sql_query = "name @@ :query OR description @@ :query"
      # @plushes = Plush.where(sql_query, query: "%#{params[:query]}%")
      @plushes = Plush.search_by_name_and_description(params[:query])
    end
    if params[:color].present?
      @plushes = @plushes.where(color: params[:color])
    end
    if params[:size].present?
      @plushes = @plushes.where(size: params[:size])
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
    @plush.destroy
    redirect_to plushes_path
  end

  private

  def plush_params
    params.require(:plush).permit(:name, :description, :price, :photo)
  end
end
