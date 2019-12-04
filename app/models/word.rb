class Word < ApplicationRecord
  belongs_to :language
  has_many :user_words
  
  scope :random_unseen, ->(user) { where.not(id: UserWord.where(user: user).pluck(:word_id)).order('RANDOM()').first }
end
