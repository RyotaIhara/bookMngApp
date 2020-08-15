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
class StudyType < ApplicationRecord
end
