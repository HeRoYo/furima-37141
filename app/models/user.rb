class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname,          presence: true
  validates :barth_day,         presence: true

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze # 半角英数字の混合パスワードのみ許可
  validates :password, format: { with: VALID_PASSWORD_REGEX, message: 'is invalid. Input half-width characters.' }

  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'is invalid. Input full-width characters.' } do
    # 全角かな、全角カナ、漢字のみ許可
    validates :family_name_kanji
    validates :first_name_kanji
  end

  with_options presence: true, format: { with: /\A[ァ-ヶー]+\z/, message: 'is invalid. Input full-width katakana characters.' } do
    # 全角カナのみ許可
    validates :family_name_kana
    validates :first_name_kana
  end
end
