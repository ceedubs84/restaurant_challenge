require 'rails_helper'

RSpec.describe MenuItemsController, type: :controller do
  describe 'GET #index' do
    it 'assigns all eligible menu items to @menu' do
      all_items = [
        create(:menu_item_with_categories),
        create(:menu_item_with_categories, name: 'Onion Peels')
      ]
      get :index
      expect(assigns(:menu_items)).to eq(all_items)
    end

    it 'renders the index html' do
      get :index
      expect(response).to render_template('index.html.erb')
    end
  end

  describe 'GET #new' do
  end

  describe 'POST #create' do
  end

  describe 'GET #show' do
  end

  describe 'GET #edit' do
  end

  describe 'PATCH #update' do
  end

  describe 'DELETE #destroy' do
  end

end
