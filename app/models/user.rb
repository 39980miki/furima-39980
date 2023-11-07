class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :nickname, presence: true
  # validates :email, uniqueness: true, format: { with: /@/ }
  # validates :password, format: { with: /[a-z\d]{6,}/i }
  validates :family_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龠]+\z/}
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龠]+\z/}
  validates :family_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/}
  validates :first_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/}
  validates :birthday, presence: true


  has_many :items
  has_many :purchases
end
