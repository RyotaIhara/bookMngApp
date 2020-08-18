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
end
