json.array!(@bids) do |bid|
  json.extract! bid, :id, :item_id, :bid_time, :user_id
  json.url bid_url(bid, format: :json)
end
