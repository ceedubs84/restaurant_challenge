require 'rails_helper'

RSpec.describe MenuItemsController, type: :controller do
  describe 'GET #index' do
    it 'assigns all eligible menu items to @menu' do
      all_items = [
        create(:menu_item_with_categories),
        create(:menu_item_with_categories, name: 'Onion Peels')
      ]
      get :index
      expect(assigns(:menu_items)).to match_array(all_items)
    end

    it 'renders the index html' do
      get :index
      expect(response).to render_template('index.html.erb')
    end
  end

  describe 'GET #new' do
    before :each do
      @admin = create(:admin)
      session[:user_id] = @admin.id
    end

    it 'creates a new MenuItem' do
      get :new
      expect(assigns(:menu_item)).to be_a_new(MenuItem)
    end

    it 'renders the new html' do
      get :new
      expect(response).to render_template('new.html.erb')
    end
  end

  describe 'POST #create' do
    before :each do
      @admin = create(:admin)
      session[:user_id] = @admin.id
    end
    it 'creates and saves a new menu_item to the database' do
      expect{
        post :create, params: { menu_item: attributes_for(:menu_item_with_categories) }
      }.to change(MenuItem, :count).by(1)
    end
    it 'redirects to the menu_items index' do
      post :create, params: { menu_item: attributes_for(:menu_item_with_categories) }
      expect(response).to redirect_to('/menu_items')
    end
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
