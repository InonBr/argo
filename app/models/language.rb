class Language < ApplicationRecord
  has_many :words
  has_many :user_languages
  has_many :users, through: :users
  has_many :quizzes

  validates :flag_url, presence: true
end
