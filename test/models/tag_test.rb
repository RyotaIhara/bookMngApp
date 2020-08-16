# == Schema Information
#
# Table name: tags
#
#  id         :integer          not null, primary key
#  deleted_at :datetime
#  remark     :string
#  tag_name   :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'test_helper'

class TagTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
