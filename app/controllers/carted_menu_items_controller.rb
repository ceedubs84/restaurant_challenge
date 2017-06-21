class CartedMenuItemsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!, only: [:create]

  def index
    @carted_menu_items = current_user.carted_menu_items.where(status: 'carted')
    if @carted_menu_items.length > 0
      render 'index.html.erb'
    else
      flash[:warning] = "You don't have any items in your shopping cart. BUY SOME STUFF NOW!"
      redirect_to '/'
    end
  end

  def create
    carted_menu_item = CartedMenuItem.new(
      user_id: current_user.id,
      menu_item_id: params[:menu_item_id],
      quantity: params[:quantity],
      status: 'carted'
    )
    carted_menu_item.save
    flash[:success] = 'Added to cart successfullly!'
    redirect_to '/carted_menu_items'
  end

  def destroy
    carted_menu_item = CartedMenuItem.find_by(id: params[:id])
    carted_menu_item.status = 'removed'
    carted_menu_item.save
    flash[:success] = 'Menu item removed!'
    redirect_to '/carted_menu_items'
  end
end
