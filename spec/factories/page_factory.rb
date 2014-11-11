FactoryGirl.define do

  factory :page, class: Hemmingway::Page do
    url 'about-us'
    locale 'en'
    html '<h1>hello there</h1>'
  end

end