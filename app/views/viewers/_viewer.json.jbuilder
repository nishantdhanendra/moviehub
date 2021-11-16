json.extract! viewer, :id, :movie_id, :created_at, :updated_at
json.url viewer_url(viewer, format: :json)
json.token user.generate_jwt