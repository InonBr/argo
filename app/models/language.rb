class Language < ApplicationRecord
  has_many :words, dependent: :destroy
  has_many :user_languages, dependent: :destroy
  has_many :users, through: :users, dependent: :destroy
  has_many :quizs, dependent: :destroy
end
