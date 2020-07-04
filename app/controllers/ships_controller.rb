class ShipsController < ApplicationController
  before_action :set_ship, only: [:update, :destroy]

  def create
    @ship = Ship.create(ship_params)
    json_response(@ship, :created)
  end

  def destroy
    @ship.destroy
    head :no_content
  end

  def update
    @ship.update(ship_params)
  end

  private

  def ship_params
    params.require(:ship).permit(:name, :ship_owner, containers_attributes: [:id, :container_type, :quantity, :serial_number], sailors_attributes: [:id, :sailor_type, :name ])
  end

  def set_ship
    @ship = Ship.find(params[:id])
  end
end
