require 'spec_helper'

describe Hemmingway::RouteHelpers do
  let(:page) { create(:page) }

  before { Rails.application.default_url_options = {host: 'test.host'} }

  def match_path_and_url(path, helper, *args)
    expect(send("#{helper}_path", *args)).to eq(path)
    expect(send("#{helper}_url", *args)).to match(Regexp.new(path))
  end

  it 'has path to #index' do
    match_path_and_url('/hemmingway/pages', :hw_pages)
  end

  it 'has path to #new' do
    match_path_and_url('/hemmingway/pages/new', :new_hw_page)
  end

  it 'has path to #show' do
    match_path_and_url("/hemmingway/pages/#{page.url}", :hw_page, page)
  end

  it 'has path to parent engine #show' do
    match_path_and_url("/pages/#{page.url}", :parent_page, page)
  end

  it 'has path to #edit' do
    match_path_and_url("/hemmingway/pages/#{page.url}/edit", :edit_hw_page, page)
  end

  it 'has path to #styles' do
    match_path_and_url('/hemmingway/pages/styles', :styles_hw_pages)
  end

  it 'has path to #preview' do
    match_path_and_url('/hemmingway/pages/preview', :preview_hw_pages)
  end

  context 'with root routes' do
    before do
      Hemmingway.routes = :root
      Rails.application.reload_routes!
    end

    it 'has path to #show' do
      match_path_and_url("/hemmingway/pages/#{page.url}", :hw_page, page)
    end

    it 'has parent path to #show' do
      match_path_and_url("/#{page.url}", :parent_page, page)
    end
  end

  context 'with alternate routes' do
    before do
      Hemmingway.routes = :content
      Rails.application.reload_routes!
    end

    it 'has path to #show' do
      match_path_and_url("/hemmingway/pages/#{page.url}", :hw_page, page)
    end

    it 'has parent path to #show' do
      match_path_and_url("/content/#{page.url}", :parent_page, page)
    end
  end

end