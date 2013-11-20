json.array!(@tags) do |tag|
  json.extract! tag, :name, :count
  json.url tag_url(tag, format: :json)
end
