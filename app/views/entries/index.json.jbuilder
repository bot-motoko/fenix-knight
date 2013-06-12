json.array!(@entries) do |entry|
  json.extract! entry, :tag_list
  json.url entry_url(entry, format: :json)
end
