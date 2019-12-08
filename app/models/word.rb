class Word < ApplicationRecord
  belongs_to :language
  has_many :user_words
  scope :random_unseen, ->(user) { where(language: user.user_languages.find_by(active: true).language).where.not(id: UserWord.where(user: user).pluck(:word_id)).order('RANDOM()') }
end
