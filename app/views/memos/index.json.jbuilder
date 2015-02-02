json.array!(@memos) do |memo|
  json.extract! memo, :id, :user_id, :venue, :venue_id
  json.url memo_url(memo, format: :json)
end
