json.array!(@bunches) do |bunch|
  json.extract! bunch, :landing
  json.url bunch_url(bunch, format: :json)
end
