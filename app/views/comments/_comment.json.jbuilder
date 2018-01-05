json.extract! comment, :id, :text, :task, :user, :created_at, :updated_at
json.url comment_url(comment, format: :json)
