module LanguagesHelper
  def symbol(language)
    lan = Language.find_by(name: language)
    image_tag("#{language.downcase}.png", alt: "#{language} flag", class: 'language-img')
  end
end
