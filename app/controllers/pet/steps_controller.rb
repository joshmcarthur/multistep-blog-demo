class Pet::StepsController < ApplicationController
  include Wicked::Wizard
  steps *Pet.form_steps

  def show
  end

  def update
  end
end
