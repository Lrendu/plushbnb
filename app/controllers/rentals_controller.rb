class RentalsController < ApplicationController
  def create
    @rental = Rental.new(rental_params)
    @rental.save
  end

  private

  def rental_params
    params.require(:rental).permit(:date, :tenant_id, :plush_id)
  end
end
