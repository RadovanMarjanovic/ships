class ShipsController < ApplicationController
  before_action :set_ship, only: [:update, :destroy]

  def create
    @ship = Ship.create(ship_params)
    json_response(@ship, :created)
  end

  def index
    # http://localhost:3000/ships?ship_name=apl&ship_owner=&ship_serial_number=&sailor_name=&sailor_type=&container_type=&container_serial_number=
    # @search_result = []
    # if (params[:ship_name].present? || params[:ship_owner].present? || params[:ship_serial_number].present?)
    #   @search_result << Ship.where("ships.name ILIKE ? OR ships.ship_owner ILIKE ? OR ships.serial_number ILIKE ?", params[:ship_name], params[:ship_owner], params[:ship_serial_number])
    # end
    # if (params[:ship_name].present? || params[:ship_owner].present? || params[:ship_serial_number].present?)
    #   @search_result << Ship.where("ships.name ILIKE ? OR ships.ship_owner ILIKE ? OR ships.serial_number ILIKE ?", params[:ship_name], params[:ship_owner], params[:ship_serial_number])
    # end

    # render json: @search_result.flatten, status: :ok

    sql_query = "\
        ships.name ILIKE :query \
        OR ships.ship_owner ILIKE :query \
        OR ships.serial_number ILIKE :query \
        OR sailors.name ILIKE :query \
        OR sailors.sailor_type ILIKE :query \
        OR containers.container_type ILIKE :query \
        OR containers.serial_number ILIKE :query \
        "
    @ships = Ship.left_joins(:containers).left_joins(:sailors).where(sql_query, query: "%#{params[:query]}%")
    render json: @ships, status: :ok
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
