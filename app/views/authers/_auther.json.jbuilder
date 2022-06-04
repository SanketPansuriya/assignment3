json.extract! auther, :id, :name, :address, :profile_picture, :created_at, :updated_at
json.url auther_url(auther, format: :json)
json.profile_picture url_for(auther.profile_picture)
