class User < ApplicationRecord
  has_many :user_words, dependent: :destroy
  has_many :words, through: :user_words, dependent: :destroy
  has_many :user_languages, dependent: :destroy
  has_many :languages, through: :user_languages, dependent: :destroy
  has_many :quizs, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username,
            uniqueness: true,
            presence: true,
            allow_blank: false,
            length: { minimum: 3 }
end
