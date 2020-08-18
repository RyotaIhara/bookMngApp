# == Schema Information
#
# Table name: study_book_tag_relations
#
#  id            :integer          not null, primary key
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  study_book_id :integer
#  tag_id        :integer
#
# Indexes
#
#  index_study_book_tag_relations_on_study_book_id  (study_book_id)
#  index_study_book_tag_relations_on_tag_id         (tag_id)
#
# Foreign Keys
#
#  study_book_id  (study_book_id => study_books.id)
#  tag_id         (tag_id => tags.id)
#
require 'test_helper'

class StudyBookTagRelationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
