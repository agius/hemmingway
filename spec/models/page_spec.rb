require 'spec_helper'

describe Hemmingway::Page do
  let(:page) { create(:page) }

  it 'has valid attributes' do
    expect(page.url).to eq('about-us')
    expect(page.locale).to eq('en')
    expect(page.html).to eq('<h1>hello there</h1>')
  end

end