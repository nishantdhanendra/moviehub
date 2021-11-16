class MovieResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :title, :string
  attribute :year, :string
  attribute :duration, :string
  attribute :description, :string

  # Direct associations

  # Indirect associations
end
