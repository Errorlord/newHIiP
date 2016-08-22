json.array!(@aarons) do |aaron|
  json.extract! aaron, :id, :title, :content
  json.url aaron_url(aaron, format: :json)
end
