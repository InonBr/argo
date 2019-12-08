module LanguagesHelper
  def symbol(language)
    lan = Language.find_by(name: language)
    image_tag(lan.flag_url, alt: "#{language} flag", class: 'language-img')
  end
end
