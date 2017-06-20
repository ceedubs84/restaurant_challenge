class PagesController < ApplicationController
  def index
    'index.html.erb'
  end

  def about
    'about.html.erb'
  end

  def admin_panel
    @menu_items = MenuItem.all
    @item_count = @menu_items.count
    @users = User.all
    @user_count = @users.count
    # @orders = Qrder.all
    # @order_count = @orders.count
    'admin_panel.html.erb'
  end
end
