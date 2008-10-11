require 'merb-auth-more/mixins/salted_user'

class Cook

  include DataMapper::Resource
  include Merb::Authentication::Mixins::SaltedUser

  # Attributes
  property :id,               Serial
  property :login,            String
  property :email,            String
  property :identity_url,     String
  property :created_at,       DateTime
  property :updated_at,       DateTime

  # Associations
  has n, :recipes

  # Validations
  validates_present   :login, :email
  validates_is_unique :login, :email
  validates_format    :email, :as => :email_address

end
