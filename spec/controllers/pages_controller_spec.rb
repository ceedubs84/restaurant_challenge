require 'rails_helper'

RSpec.describe PagesController, type: :controller do
  describe 'GET #index' do
    it 'renders the main index page' do
      get :index
      expect(response).to render_template("index.html.erb")
    end
  end

  describe 'GET #about' do
    it 'renders the about page' do
      get :about
      expect(response).to render_template('about.html.erb')
    end
  end

  describe 'GET #admin_panel' do
    it 'renders the admin panel page' do
      get :admin_panel
      expect(response).to render_template('admin_panel.html.erb')
    end
  end
end
