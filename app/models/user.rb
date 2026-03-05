# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  serialize :history, type: Array, coder: JSON
end
