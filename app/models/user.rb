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
end
