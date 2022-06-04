json.extract! book, :id, :name, :cover_photos, :auther_id, :created_at, :updated_at
json.url book_url(book, format: :json)
json.cover_photos do
  json.array!(book.cover_photos) do |cover_photo|
    json.id cover_photo.id
    json.url url_for(cover_photo)
  end
end
