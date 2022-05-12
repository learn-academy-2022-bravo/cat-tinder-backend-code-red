class VampiresController < ApplicationController

    def index
        vampires = Vampire.all
        render json: vampires
    end

    def create
        vampire = Vampire.create(vampire_params)
        render json: vampire
    end

    def update
        vampire = Vampire.find(params[:id])
        vampire.update(vampire_params)
        render json: vampire
    end

    def destroy
        vampire = Vampire.find(params[:id])
        vampires = Vampire.all
        if vampire.destroy
         render json: vampires
        else 
            render json: vampires.errors
        end
    end

    private
    def vampire_params
      params.require(:vampire).permit(:name, :age, :enjoys, :image)
    end
end
