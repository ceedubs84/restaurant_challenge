require 'rails_helper'

RSpec.describe OrdersController, type: :controller do
  describe 'POST #create' do
    before :each do
      @user = create(:user)
      session[:user_id] = @user.id
    end
    it 'creates and saves a new order to the database' do
      expect{
        post :create, params: { order: attributes_for(:order_with_carted_menu_items) }
      }.to change(Order, :count).by(1)
    end
    it 'redirects to the order show view' do
      post :create, params: { order: attributes_for(:order_with_carted_menu_items) }
      expect(response).to redirect_to("/orders/#{@order.id}")
    end
  end

  describe 'GET #show' do
    before :each do
      @order = create(:order_with_carted_menu_items)
      @user = create(:user)
      session[:user_id] = @user.id
    end
    it 'assigns the requested order to @order' do
      get :show, params: { id: @order.id }
      expect(assigns(:order)).to eq(@order)
    end

    it 'renders the show page' do
      get :show, params: { id: @order.id }
      expect(response).to render_template('show.html.erb')
    end
  end
end
