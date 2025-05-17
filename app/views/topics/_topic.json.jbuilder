json.extract! topic, :id, :topicable_id, :topicable_type, :title, :number, :description, :prologue, :estimated_time, :objective, :content, :homework, :credits_and_sources, :content_type, :activity, :homework, :created_at, :updated_at
json.url topic_url(topic, format: :json)
