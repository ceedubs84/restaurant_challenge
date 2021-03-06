require 'rails_helper'

RSpec.describe MenuItemsController, type: :controller do
  describe 'GET #index' do
    it 'assigns all eligible menu items to @menu_item' do
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
    it 'renders new.html if item does not save' do
      allow_any_instance_of(MenuItem).to receive(:save).and_return(false)
      post :create, params: { menu_item: attributes_for(:menu_item_with_categories) }
      expect(response).to render_template('new.html.erb')
    end
  end

  describe 'GET #show' do
    before :each do
      @menu_item = create(:menu_item_with_categories)
    end

    context 'admin signed in' do
      before :each do
        @admin = create(:admin)
        session[:user_id] = @admin.id
      end

      it 'assigns the requested menu_item to @menu_item' do
        get :show, params: { id: @menu_item.id }
        expect(assigns(:menu_item)).to eq(@menu_item)
      end

      it 'renders the show page' do
        get :show, params: { id: @menu_item.id }
        expect(response).to render_template('show.html.erb')
      end
    end
  end

  describe 'GET #edit' do
    it 'assigns the requested menu_item as @menu_item' do
      @menu_item = create(:menu_item_with_categories)
      get :edit, params: { id: @menu_item.id }
      expect(assigns(:menu_item)).to eq(@menu_item)
    end
    it 'renders the :edit template' do
      menu_item = create(:menu_item_with_categories)
      get :edit, params: { id: menu_item.id }
      expect(response).to render_template('edit.html.erb')
    end
  end

  describe 'PATCH #update' do
    before :each do
      @admin = create(:admin)
      session[:user_id] = @admin.id
      @menu_item = create(:menu_item_with_categories)
    end

    context 'valid attributes' do
      it 'locates the requested @menu_item' do
        patch :update, params: { id: @menu_item.id, menu_item: attributes_for(:menu_item_with_categories) }
        expect(assigns(:menu_item)).to eq(@menu_item)
      end
      
      it 'redirects to the updated menu_item' do
        patch :update, params: { id: @menu_item, menu_item: attributes_for(:menu_item_with_categories) }
        expect(response).to redirect_to("/menu_items/#{@menu_item.id}")
      end
    end
  end

  describe 'DELETE #destroy' do
    before :each do
      @admin = create(:admin)
      session[:user_id] = @admin.id
      @menu_item = create(:menu_item_with_categories)
    end
    it 'removes the desired menu_item from the database' do
      expect{
        delete :destroy, params: { id: @menu_item.id }
      }.to change(MenuItem, :count).by(-1)
    end
    it 'redirects to the menu_item index' do
      delete :destroy, params: { id: @menu_item.id }
      expect(response).to redirect_to('/menu_items')
    end
  end
end
