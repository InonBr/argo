class UserLanguage < ApplicationRecord
  belongs_to :user
  belongs_to :language

  scope :active_language, -> (user) { find_by(user: user, active: true) }
end
