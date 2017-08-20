json.extract! user, :id, :username, :email, :icon, :created_at, :updated_at
json.url user_url(user, format: :json)
