json.array!(@cookbooks) do |cookbook|
  json.extract! cookbook, :isbn, :author, :price, :title
  json.url cookbook_url(cookbook, format: :json)
end
