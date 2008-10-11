class Recipe

  include DataMapper::Resource

  # Attributes
  property :id,           Serial
  property :title,        String,  :nullable => false
  property :instructions, Text,    :lazy => [:show]
  property :created_at,   DateTime
  property :updated_at,   DateTime

  # Associations
  belongs_to :cook

  # Validations

end
