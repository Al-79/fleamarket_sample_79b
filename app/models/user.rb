class User < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable
  has_many :items
  has_many :addresses
  has_one :credit_card

VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
VALID_NAME = /\A[ぁ-んァ-ン一-龥]/
VALID_NAME_KANA = /\A[ァ-ヶー－]+\z/

validates :nickname, presence: true, length: { maximum: 20 }
validates :email, presence: true, uniqueness: { case_sensitive: true },format: { with: VALID_EMAIL_REGEX }
validates :password, presence: true, confirmation: true,length: { minimum: 7 }, format: { with: VALID_PASSWORD_REGEX }# ここが文字数の正規表現、パスワードの正規表現
validates :first_name, presence: true, format: { with: VALID_NAME}# ここがユーザー本名全角の正規表現
validates :family_name, presence: true, format: { with: VALID_NAME}# ここがユーザー本名全角の正規表現
validates :first_name_kana, presence: true, format: { with: VALID_NAME_KANA}# ここがフリガナ全角の正規表現
validates :family_name_kana, presence: true, format: { with: VALID_NAME_KANA}# ここがフリガナ全角の正規表現
validates :birth_date, presence: true
end