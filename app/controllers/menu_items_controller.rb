class MenuItemsController < ApplicationController
  before_action :authenticate_admin!, only: [:new, :create, :update]

  def index
    @menu_items = MenuItem.all
    render 'index.html.erb'
  end

  def new
    @menu_item = MenuItem.new
    render 'new.html.erb'
  end

  def create
    @menu_item = MenuItem.new(menu_item_params)
    if @menu_item.save
      flash[:success] = 'Item = #{@menu_item.name} created successfully!'
      redirect_to "/menu_items/#{@menu_item.id}"
    else
      flash[:warning] = 'Menu item did not save. Please try again.'
      render 'new.html.erb'
    end
  end

  def show
    @menu_item = MenuItem.find_by(id: params[:id])
    render 'show.html.erb'
  end

  def edit
    @menu_item = MenuItem.find_by(id: params[:id])
    render 'edit.html.erb'
  end

  def update
    @menu_item = MenuItem.find_by(id: params[:id])
    @menu_item.name = params[:name]
    @menu_item.description = params[:description]
    @menu_item.price = params[:price]
    if @menu_item.save
      flash[:success] = 'Menu item updated successfully!'
      redirect_to '/menu_items'
    else
      flash[:warning] = 'Could not update. Try again.'
      render "/menu_items/#{@menu_item.id}/edit"
    end
  end

  def destroy
    @menu_item = MenuItem.find_by(id: params[:id])
    @menu_item.destroy
    flash[:danger] = 'Menu item destroyed.'
    redirect_to '/menu_items'
  end

  private

  def menu_item_params
    params.require(:menu_item).permit(
      :name,
      :description,
      :price
    )
  end
end
