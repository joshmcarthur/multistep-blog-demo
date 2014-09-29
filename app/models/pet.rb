class Pet < ActiveRecord::Base
  cattr_accessor :form_steps do
    %w(identity characteristics instructions)
  end

  attr_accessor :form_step

  validates :name, :owner_name, presence: true, if: -> { required_for_step?(:identity) }
  validates :identifying_characteristics, :colour, presence: true, if: -> { required_for_step?(:characteristics) }
  validates :special_instructions, presence: true, if: -> { required_for_step?(:instructions) }

  def required_for_step?(step)
    return true if form_step.nil?
    return true if self.form_steps.index(step.to_s) <= self.form_steps.index(form_step)
  end



end
