class CreatePets < ActiveRecord::Migration
  def change
    create_table :pets do |t|
      t.string :name
      t.string :colour
      t.string :owner_name
      t.text :identifying_characteristics
      t.text :special_instructions

      t.timestamps
    end
  end
end
