json.extract! task, :id, :name, :description, :due_data, :category_id, :created_at, :updated_at
json.url task_url(task, format: :json)
