# == Schema Information
#
# Table name: study_books
#
#  id            :integer          not null, primary key
#  author        :string
#  book_name     :string           not null
#  deleted_at    :datetime
#  price         :integer
#  publisher     :string
#  remark        :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  study_type_id :integer
#  user_id       :integer
#
# Indexes
#
#  index_study_books_on_study_type_id  (study_type_id)
#  index_study_books_on_user_id        (user_id)
#
# Foreign Keys
#
#  study_type_id  (study_type_id => study_types.id)
#  user_id        (user_id => users.id)
#
require 'test_helper'

class StudyBookTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
