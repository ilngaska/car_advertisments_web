# frozen_string_literal: true

class UserManager
  def authenticate(email, password)
    user = find_user(email)
    return nil unless user

    BCrypt::Password.new(user.password_digest) == password ? user : nil
  rescue BCrypt::Errors::InvalidHash
    nil
  end

  def find_user(email)
    User.find_by(email: email)
  end

  def add_search_to_history(email, query)
    user = find_user(email)
    return unless user

    clean_query = query.to_h.symbolize_keys.slice(:make, :model, :year_from, :year_to, :price_from, :price_to)
    return if clean_query.values.all?(&:blank?)

    user.search_histories.create(query: clean_query)
  end
end
