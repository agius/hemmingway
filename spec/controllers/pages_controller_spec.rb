require 'spec_helper'

describe Hemmingway::PagesController do
  routes { Hemmingway::Engine.routes }

  let!(:page) { create(:page) }
  let!(:other_page) { create(:page, url: 'faq') }

  render_views

  it 'shows index' do
    get :index
    expect(response).to be_ok
    expect(assigns[:pages]).to include(page)
    expect(assigns[:pages]).to include(other_page)
  end

  it 'shows page' do
    get :show, id: page.url
    expect(response).to be_ok
    expect(assigns[:page]).to eq(page)
  end

  it 'show new page form' do
    get :new
    expect(response).to be_ok
  end

  it 'creates a new page' do
    post :create, page: {url: 'tos', locale: 'en', html: '<h2>terms of service</h2>'}
    expect(assigns[:page]).to be_persisted
    expect(response).to redirect_to page_path(assigns[:page].url)
  end

  it 'shows edit form' do
    get :edit, id: page.url
    expect(assigns[:page]).to eq(page)
    expect(response).to be_ok
  end

  it 'updates existing page' do
    new_html = '<h2>DISCO</h2>'
    patch :update, id: page.url, page: {html: new_html}
    expect(response).to redirect_to page_path(assigns[:page].url)
    expect(assigns[:page].html).to eq new_html
  end

  it 'deletes a record' do
    delete :destroy, id: page.url
    expect(response).to redirect_to pages_path
    expect(assigns[:page]).to be_destroyed
  end

  context 'with an admin check' do
    before { Hemmingway.admin_check = Proc.new { params[:token].present? } }

    it 'works if check passes' do
      get :index, token: '123'
      expect(response).to be_ok
    end

    it 'fails if check fails' do
      expect{get :index}.to raise_error(ActionController::BadRequest)
    end
  end

  context 'with a different layout' do
    before { Hemmingway.layout = 'other_layout' }

    it 'renders page with specified layout' do
      get :show, id: page.url
      expect(response).to render_template('other_layout')
    end
  end

end