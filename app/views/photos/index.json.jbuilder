json.array!(@photos) do |photo|
  json.extract! photo, :id, :item_id, :filename, :mime_type, :file_contents
  json.url photo_url(photo, format: :json)
end
