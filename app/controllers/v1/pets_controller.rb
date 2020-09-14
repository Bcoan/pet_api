# frozen_string_literal: true

module V1
  class PetsController < ApplicationController
    before_action :set_pet, only: %i[show update destroy]
    before_action :set_owner, only: %i[create index]

    # GET /pets
    def index
      @pets = @owner.pets

      render json: @pets
    end

    # GET /pets/1
    def show
      render json: @pet
    end

    # POST /pets
    def create
      @pet = @owner.pets.create(pet_params)

      if @owner.save
        render json: @pet, status: :created, location: @pet
      else
        render json: @owner.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /pets/1
    def update
      if @pet.update(pet_params)
        render json: @pet
      else
        render json: @pet.errors, status: :unprocessable_entity
      end
    end

    # DELETE /pets/1
    def destroy
      @pet.destroy
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_pet
      @pet = Pet.find(params[:id])
    end

    def set_owner
      @owner = Owner.find(params[:owner_id])
    end

    # Only allow a trusted parameter "white list" through.
    def pet_params
      params.require(:pet).permit(:name, :monthly_cost, :pet_type_id)
    end
  end
end
