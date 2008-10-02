class Recipe

  include DataMapper::Resource
  include DataMapper::Timestamp
  include DataMapper::Serialize

  # Attributes
  property :id,           Integer, :serial => true
  property :title,        String,  :nullable => false
  property :instructions, Text,    :lazy => [:show]
  property :created_at,   DateTime
  property :updated_at,   DateTime

  # Associations
  belongs_to :cook

  # Validations

end
