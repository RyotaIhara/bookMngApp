# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  deleted_at      :datetime
#  password_digest :string           not null
#  remember_token  :string
#  user_name       :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
  has_secure_password
  
  has_many :study_books

	def self.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def self.encrypt(token)
    Digest::SHA256.hexdigest(token.to_s)
  end

  # ユーザー名変更の際のバリデーション
  validates :user_name, presence: true, length: { maximum: 30 }, on: :user_name_valid
  validate :check_unique_user_name, on: :user_name_valid

  # パスワード変更の際のバリデーション
  VALID_PASSWORD_REGEX = /\A[a-zA-Z0-9]+\z/
  validates :password, presence: true, length: { minimum: 6, maximum: 30 },
              format: { with: VALID_PASSWORD_REGEX,
              message: "は半角英数字で入力してください"},
              on: :password_valid

  def check_unique_user_name
    puts "メソッドが動いた"
    @user = User.where(user_name: user_name, deleted_at: nil)
    if @user.present?
      errors.add(:user_name, "は既に登録されています。")
    end
  end

  def not_exist_user
    errors.add(:user_name, "が存在しません。")
  end
end
