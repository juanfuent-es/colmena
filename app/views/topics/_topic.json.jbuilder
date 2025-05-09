json.extract! topic, :id, :theme_id, :title, :objective, :estimated_time, :content_type, :exercises, :homework, :comments, :reference_material, :credits_and_sources, :created_at, :updated_at
json.url topic_url(topic, format: :json)
