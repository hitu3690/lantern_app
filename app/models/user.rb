class User < ApplicationRecord
  before_save :downcase_email #⑧
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  validates :name,
    presence: true, #①
    length: { maximum: 50 } #③
  validates :email,
    presence: true, #②
    length: { maximum: 255 }, #④
    format: { with: VALID_EMAIL_REGEX }, #⑤
    uniqueness: { case_sensitive: false } #⑥⑦
    
  has_secure_password
  validates :password,
    presence: true,
    length: { minimum: 6 }
    
  private
    def downcase_email #⑧のメソッド
      email.downcase!
    end
end
