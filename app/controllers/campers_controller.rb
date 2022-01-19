class CampersController < ApplicationController

    def index
        render json: Camper.all
    end

    def show
        camper = Camper.find_by(id:params[:id])
        if camper
            render json: camper, serializer: CamperShowSerializer, status: :created
        else 
            render json: {"error": "Camper not found"}, status: :not_found
        end
    end

    def create
        new_camper = Camper.new(camper_params)
        if new_camper.save
            render json: new_camper
        else
            render json: {"error": new_camper.errors.full_messages}, status: :unprocessable_entity
        end
    end

    private

    def camper_params
        params.permit(:name, :age)
    end

end
