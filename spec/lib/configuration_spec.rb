require 'spec_helper'

describe Hemmingway::Configuration do

  before { Hemmingway.set_default_configuration }

  it 'sets a default configuration' do
    expect(Hemmingway.layout).to eq('hemmingway/application')
    expect(Hemmingway.home_page).to eq(nil)
    expect(Hemmingway.admin_check.call).to eq(true)
  end

  it 'runs configuration' do
    Hemmingway.configure do |config|
      config.layout = 'other_application'
      config.home_page = 'home'
      config.admin_check = Proc.new { false }
    end

    expect(Hemmingway.layout).to eq('other_application')
    expect(Hemmingway.home_page).to eq('home')
    expect(Hemmingway.admin_check.call).to eq(false)
  end

  it 'raises argument error unless admin_check is a Proc' do
    expect{Hemmingway.admin_check = nil}.to raise_error(ArgumentError)
  end

end