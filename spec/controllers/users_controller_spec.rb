require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET #new' do
    it 'creates a new User' do
      get :new
      expect(assigns(:user)).to be_a_new(User)
    end

    it 'renders the new html' do
      get :new
      expect(response).to render_template('new.html.erb')
    end
  end
end
