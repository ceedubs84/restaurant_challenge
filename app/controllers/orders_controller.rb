class OrdersController < ApplicationController
  before_action :authenticate_user!

  def create
    order = Order.new(user_id: current_user.id)
    order.save
    carted_menu_items = current_user.carted_menu_items.where(status: 'carted')
    carted_menu_items.update_all(status: 'purchased', order_id: order.id)
    if order.update_all_totals
      flash[:success] = 'Your order was created successfully!'
      redirect_to "/orders/#{order.id}"
    else
      flash[:success] = 'Your order was created successfully!'
      redirect_to '/carted_menu_items'
    end
  end

  def show
    @order = Order.find_by(id: params[:id])
    render 'show.html.erb'
  end
end
