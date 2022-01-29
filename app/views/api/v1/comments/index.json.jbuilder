json.array!(@comments) do |comment|
  json.post_author comment.post.user.name
  json.post_title comment.post.title
  json.post_text comment.post.text
  json.comments do
    json.username comment.user.name
    json.comment_text comment.text
  end
end
