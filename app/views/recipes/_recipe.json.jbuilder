json.extract! recipe, :id, :title, :photo, :cant,:time, :ingredients, :directions, :created_at, :updated_at
json.url recipe_url(recipe, format: :json)
