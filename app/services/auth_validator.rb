# frozen_string_literal: true

class AuthValidator
  EMAIL_REGEXP = /\A[^@]{5,}@[^@]+\.[^@]+\z/
  PASSWORD_REGEXP = /\A(?=.*[A-Z])(?=(.*[^a-zA-Z0-9]){2,}).{8,20}\z/

  class << self
    def valid_email?(email)
      return false if email.blank?

      email.match?(EMAIL_REGEXP)
    end

    def valid_password?(password)
      return false if password.blank?

      password.match?(PASSWORD_REGEXP)
    end
  end
end
