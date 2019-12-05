class UserWord < ApplicationRecord
  belongs_to :user
  belongs_to :word

  validates :word, uniqueness: { scope: :user }

  scope :current_language, ->(user) { joins(:word).where(words: { language_id: user.user_languages.find_by(active: true).language.id }) }
end
