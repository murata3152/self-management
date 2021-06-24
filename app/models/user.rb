class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :post

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'は文字と数字の両方を含めて設定してください' 
  with_options presence: true do
    validates :nickname
    validates :birthday
    with_options format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "が無効です。全幅文字で入力してください"} do
      validates :last_name
      validates :first_name
    end
    with_options format: {with: /\A[ァ-ヶー]+\z/, message: "が無効です。全幅カタカナ文字で入力してください"} do
      validates :last_name_details
      validates :first_name_details
    end
  end
end
