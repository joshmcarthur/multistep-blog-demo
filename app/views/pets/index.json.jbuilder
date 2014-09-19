json.array!(@pets) do |pet|
  json.extract! pet, :id, :name, :colour, :owner_name, :identifying_characteristics, :special_instructions
  json.url pet_url(pet, format: :json)
end
