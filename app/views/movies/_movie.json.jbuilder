json.extract! movie, :id, :title, :year, :duration, :description, :created_at,
              :updated_at
json.url movie_url(movie, format: :json)
