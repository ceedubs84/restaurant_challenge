class CartedMenuItemsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!

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
    carted_menu_item = CartedMenuItem.new(carted_menu_item_params)
    if carted_menu_item.save
      flash[:success] = 'Added to cart successfullly!'
      redirect_to '/carted_menu_items'
    else
      flash[:danger] = 'Item not added to cart. Please try again'
      redirect_to '/menu_items'
    end
  end

  def destroy
    carted_menu_item = CartedMenuItem.find_by(id: params[:id])
    carted_menu_item.status = 'removed'
    carted_menu_item.save
    flash[:success] = 'Menu item removed!'
    redirect_to '/carted_menu_items'
  end

  private

  def carted_menu_item_params
    params.permit(
      :menu_item_id,
      :quantity
    ).merge(
      status: 'carted',
      user_id: current_user.id
    )
  end
end
