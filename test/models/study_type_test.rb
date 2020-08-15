# == Schema Information
#
# Table name: study_types
#
#  id         :integer          not null, primary key
#  deleted_at :datetime
#  remark     :string
#  type_name  :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'test_helper'

class StudyTypeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
