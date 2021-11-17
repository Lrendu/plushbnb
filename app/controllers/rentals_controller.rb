class RentalsController < ApplicationController
  def create
    @rental = Rental.new(rental_params)
    authorize @rental
    @rental.save
    redirect_to root_path(@plush)
  end

  private

  def rental_params
    params.require(:rental).permit(:date, :tenant_id, :plush_id)
  end
end
