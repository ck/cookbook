class Authentication

  def self.user_class
    Cook
  end

  def store_user(cook)
    return nil unless cook
    cook.id
  end

  def fetch_user(session_info)
    Cook.get(session_info)
  end

end # Authentication
