# frozen_string_literal: true

class Car < ApplicationRecord
  before_create { self.date_added ||= Date.current }
end
