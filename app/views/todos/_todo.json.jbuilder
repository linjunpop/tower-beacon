json.extract! todo, :id, :content, :status, :project_id, :creator_id, :created_at, :updated_at
json.url todo_url(todo, format: :json)
