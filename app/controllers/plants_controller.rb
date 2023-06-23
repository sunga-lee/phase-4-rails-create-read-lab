class PlantsController < ApplicationRecord
    def index
        plants= Plant.all
        render json: plants
    end
    def show
        plant = Plant.find_by(id: params[:id])
        if plant
            render json: plant, status: :ok
        else
            render json: {error: "No plant found"}, status: :not_found
        end
    end
    def create
        plant = Plant.create(plant_params)
        render json: plant, status: :created
    end
    private
    def plant_params
        params.permit(:name, :image, :price)
    end
end
