require 'rails_helper'

RSpec.describe CartedMenuItemsController, type: :controller do
  before :each do
    @user = create(:user)
    session[:user_id] = @user.id
  end
  describe 'GET #index' do
    # it 'assigns all eligible carted menu items to @carted_menu_items' do
    #   all_items = [
    #     create(:carted_menu_item),
    #     create(:carted_menu_item),
    #   ]
    #   get :index
    #   expect(assigns(:carted_menu_items)).to match_array(all_items)
    # end

  end

  describe 'POST #create' do
    # it 'creates and saves a new carted_menu_item to the database'do
    #   expect{
    #     post :create, params: { carted_menu_item: attributes_for(:carted_menu_item) }
    #   }.to change(CartedMenuItem, :count).by(1)
    # end
  end

  describe 'GET #edit' do
    # it 'assigns the requested carted_menu_item as @carted_menu_item' do
    #   @carted_menu_item = create(:carted_menu_item)
    #   get :edit, params: { id: @carted_menu_item.id }
    #   expect(assigns(:carted_menu_item)).to eq(@carted_menu_item)
    # end
    # it 'renders the :edit template' do
    #   carted_menu_item = create(:carted_menu_item)
    #   get :edit, params: { id: carted_menu_item.id }
    #   expect(response).to render_template('edit.html.erb')
    # end
  end

  describe 'PATCH #update' do
    # context 'valid attributes' do
    #   it 'locates the requested @carted_menu_item' do
    #     patch :update, params: { id: @carted_menu_item.id, menu_item: attributes_for(:carted_menu_item) }
    #     expect(assigns(:carted_menu_item)).to eq(@carted_menu_item)
    #   end
      
    #   it 'redirects to the updated carted_menu_item' do
    #     patch :update, params: { id: @carted_menu_item, menu_item: attributes_for(:carted_menu_item) }
    #     expect(response).to redirect_to("/carted_menu_items/#{@carted_menu_item.id}")
    #   end
    # end
  end

  describe 'DELETE #destroy' do
    # it 'removes the desired carted_menu_item from the database' do
    #   expect{
    #     delete :destroy, params: { id: @carted_menu_item.id }
    #   }.to change(CartedMenuItem, :count).by(-1)
    # end
    # it 'redirects to the carted_menu_item index' do
    #   delete :destroy, params: { id: @carted_menu_item.id }
    #   expect(response).to redirect_to('/carted_menu_items')
    # end
  end
end
