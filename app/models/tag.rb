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
  has_many :study_book_tag_relations
  has_many :study_books, through: :study_book_tag_relations

  validates :tag_name, presence: true, length: { maximum: 30 } 
  validates :remark, length: { maximum: 200 } 

  validate :check_unique_tag_name, on: :create

  def check_unique_tag_name
    @tag = Tag.where(tag_name: tag_name, deleted_at: nil)
    if @tag.present?
      errors.add(:tag_name, "は既に登録されています。")
    end
  end
end
