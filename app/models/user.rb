class User < ApplicationRecord
  NAME_JAPANESE_REGEX = /\A[ぁ-んァ-ヶ一-龥々ー]+\z/
  NAME_KANA_REGEX = /\A[ァ-ヶー]+\z/

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }

  with_options presence: true do
    validates :nickname
    validates :last_name, format: { with: NAME_JAPANESE_REGEX }
    validates :first_name, format: { with: NAME_JAPANESE_REGEX }
    validates :last_name_reading, format: { with: NAME_KANA_REGEX }
    validates :first_name_reading, format: { with: NAME_KANA_REGEX }
    validates :birthday
  end
end
