class UserWord < ApplicationRecord
  belongs_to :user
  belongs_to :word

  validates :word, uniqueness: { scope: :user }

  validate :user_language_exists, on: :create

  def user_language_exists
    errors.add(:user_language, "- User doesn't have user language yet") if !user.languages.include?(word.language)
  end

  scope :current_language, ->(user) { joins(:word).where(words: { language: user.user_languages.find_by(active: true).language }) }

  include PgSearch::Model
  pg_search_scope :search_original_and_translation,
                  associated_against: {
                    word: [:original, :translation]
                  },
                  using: {
                    tsearch: { prefix: true }
                  }
end
