require 'spec_helper'

describe 'routes' do
  routes { Dummy::Application.routes }

  it 'routes to #index' do
    expect(get: '/hemmingway/pages').to route_to(action: 'index', controller: 'hemmingway/pages')
  end

  it 'routes to #index' do
    expect(get: '/hemmingway/').to route_to(action: 'index', controller: 'hemmingway/pages')
  end

  it 'routes to #show' do
    expect(get: '/hemmingway/pages/about-us').to route_to(action: 'show', controller: 'hemmingway/pages', id: 'about-us')
  end

  it 'routes to #new' do
    expect(get: '/hemmingway/pages/new').to route_to(action: 'new', controller: 'hemmingway/pages')
  end

  it 'routes to #create' do
    expect(post: '/hemmingway/pages', page: {html: 'none'}).to route_to(action: 'create', controller: 'hemmingway/pages')
  end

  it 'routes to #edit' do
    expect(get: '/hemmingway/pages/about-us/edit').to route_to(action: 'edit', controller: 'hemmingway/pages', id: 'about-us')
  end

  it 'routes to #update via patch' do
    expect(patch: '/hemmingway/pages/about-us').to route_to(action: 'update', controller: 'hemmingway/pages', id: 'about-us')
  end

  it 'routes to #update via put' do
    expect(put: '/hemmingway/pages/about-us').to route_to(action: 'update', controller: 'hemmingway/pages', id: 'about-us')
  end

  it 'routes to #destroy' do
    expect(delete: '/hemmingway/pages/about-us').to route_to(action: 'destroy', controller: 'hemmingway/pages', id: 'about-us')
  end

  context 'with default configuration' do
    it 'routes to page at /pages' do
      expect(routes.parent_page_path('about-us')).to eq('/pages/about-us')
    end
  end

end