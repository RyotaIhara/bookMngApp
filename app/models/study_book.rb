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
class StudyBook < ApplicationRecord
  belongs_to :user
  belongs_to :study_type

  has_many :study_book_tag_relations
  has_many :tags, through: :study_book_tag_relations
  accepts_nested_attributes_for :tags, reject_if: :all_blank, allow_destroy: true

  validates :book_name, presence: true, length: { maximum: 30 }
  validates :author, length: { maximum: 30 }
  validates :publisher, length: { maximum: 30 }
  validates :price, length: { maximum: 9 }
  validates :remark, length: { maximum: 200 }

  validate :check_unique_book_name, on: :create

  def check_unique_book_name
    @study_book = StudyBook.where(book_name: book_name, user_id: user_id, deleted_at: nil)
    if @study_book.present?
      errors.add(:book_name, "は既に登録されています。")
    end
  end
end
