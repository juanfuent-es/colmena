json.extract! page, :id, :title, :description, :image, :slug, :keywords, :og_type, :created_at, :updated_at
json.url page_url(page, format: :json)