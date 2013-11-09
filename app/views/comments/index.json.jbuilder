json.array!(@comments) do |comment|
  json.extract! comment, :user_id, :post_id, :title, :content
  json.url comment_url(comment, format: :json)
end
