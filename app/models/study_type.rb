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
  has_many :study_books

  validates :type_name, presence: true, length: { maximum: 30 }
  validates :remark, length: { maximum: 200 }

  validate :check_unique_type_name

  def check_unique_type_name
    @study_type = StudyType.where(type_name: type_name, deleted_at: nil)
    if @study_type.present?
      errors.add(:type_name, "は既に登録されています。")
    end
  end
end
