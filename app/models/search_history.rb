# frozen_string_literal: true

# == Schema Information
#
# Table name: search_histories
#
#  id         :bigint           not null, primary key
#  query      :jsonb
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_search_histories_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class SearchHistory < ApplicationRecord
  belongs_to :user

  MAXIMUM_QUERY_LENGTH = 500 

  validates :query, presence: true, length: { maximum: MAXIMUM_QUERY_LENGTH }

  def details
    query.compact_blank.map { |k, v| "#{k.humanize}: #{v}" }.join(', ')
  end
end
