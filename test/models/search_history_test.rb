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
require 'test_helper'

class SearchHistoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
