class MenuItemsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authenticate_admin!, only: [:new, :create, :update]

  def index
    if params[:category_name] != nil
      selected_category = Category.find_by(name: params[:category_name])
      @menu_items = selected_category.menu_items
    else
      sort_attribute = params[:sort] || "name"
      sort_order = params[:sort_order] || "asc"
      @menu_items = MenuItem.order(sort_attribute => sort_order)
    end
    @categories = Category.all
    render 'index.html.erb'
  end

  def new
    @menu_item = MenuItem.new
    render 'new.html.erb'
  end

  def create
    @menu_item = MenuItem.new(menu_item_params)
    if @menu_item.save
      flash[:success] = "#{@menu_item.name} added to menu!"
      redirect_to '/menu_items'
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
    @menu_item.avatar = params[:file]
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
      :price,
      :avatar,
      category_ids: []
    )
  end
end
