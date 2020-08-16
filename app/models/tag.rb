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
class Tag < ApplicationRecord
end
