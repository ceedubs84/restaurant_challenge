class PagesController < ApplicationController
  def index
    render 'index.html.erb'
  end

  def about
    @about_info = Faker::Lorem.paragraphs(2)
    render 'about.html.erb'
  end

  def admin_panel
    @menu_items = MenuItem.all
    @item_count = @menu_items.count
    @users = User.all
    @user_count = @users.count
    @orders = Order.all
    @order_count = @orders.count
    render 'admin_panel.html.erb'
  end
end
