# frozen_string_literal: true

require 'bcrypt'

class UserManager
  TIME_NOW = '%Y-%m-%d %H:%M:%S'

  def authenticate(email, password)
    user = find_by_email(email)
    return nil unless user

    BCrypt::Password.new(user.password_digest) == password ? user : nil
  rescue BCrypt::Errors::InvalidHash
    nil
  end

  def find_by_email(email)
    User.find_by(email: email)
  end

  def add_search_to_history(email, query)
    user = find_by_email(email)
    return unless user

    clean_query = extract_clean_query(query)
    return if clean_query.values.all?(&:blank?)

    save_history_entry(user, clean_query)
  end

  private

  def extract_clean_query(query)
    allowed = %i[make model year_from year_to price_from price_to]
    query.to_h.symbolize_keys.slice(*allowed)
  end

  def save_history_entry(user, clean_query)
    user.history ||= []
    user.history << {
      timestamp: Time.current.strftime(TIME_NOW),
      query: clean_query
    }
    user.save
  end
end
