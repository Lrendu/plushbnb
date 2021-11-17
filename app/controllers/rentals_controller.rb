class RentalsController < ApplicationController
  def create
    @rental = Rental.new(rental_params)
    @plush = Plush.find(params[:plush_id])
    @tenant = current_user
    authorize @rental
    @rental.save
    redirect_to plush_path(@plush), notice: "Peluche bien reservée"
  end

  private

  def rental_params
    params.require(:rental).permit(:date, :tenant_id, :plush_id)
  end
end
