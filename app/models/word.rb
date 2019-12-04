class Word < ApplicationRecord
  belongs_to :language
  has_many :user_words
end
