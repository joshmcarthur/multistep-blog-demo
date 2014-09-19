class Pet::StepsController < ApplicationController
  include Wicked::Wizard
  steps *Pet.form_steps

  def show
    @pet = Pet.find(params[:pet_id])
    render_wizard
  end

  def update
    @pet = Pet.find(params[:pet_id])
    @pet.update(pet_params(step))
    render_wizard @pet
  end

  private

  def pet_params(step)
    permitted_attributes = case step
                           when "identity"
                             [:name, :owner_name]
                           when "characteristics"
                             [:colour, :special_characteristics]
                           when "instructions"
                             [:special_instructions]
                           end

    params.require(:pet).permit(permitted_attributes).merge(form_step: step)
  end

end

