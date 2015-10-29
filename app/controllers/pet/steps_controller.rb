class Pet::StepsController < ApplicationController
  include Wicked::Wizard
  steps *Pet.form_steps
  before_action :set_pet, only: [:show, :update]

  def show
    @pet = Pet.find(params[:pet_id])
    render_wizard
  end

  def update
    @pet.update(pet_params(step))
    render_wizard @pet
  end

  private
  
  def set_pet
    @pet = Pet.find(params[:pet_id])
    @pet.form_step = step
  end

  def pet_params(step)
    permitted_attributes = case step
                           when "identity"
                             [:name, :owner_name]
                           when "characteristics"
                             [:colour, :identifying_characteristics]
                           when "instructions"
                             [:special_instructions]
                           end

    params.require(:pet).permit(permitted_attributes).merge(form_step: step)
  end

end

