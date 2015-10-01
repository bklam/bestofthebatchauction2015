json.array!(@statuses) do |status|
  json.extract! status, :id, :status_type, :description
  json.url status_url(status, format: :json)
end
