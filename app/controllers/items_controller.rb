class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    binding.pry
    Item.create(item_params)
  end

  def show
    @items = Item.all
  end

  private
  def item_params
    params.require(:item).permit(:name, :introduction)
  end

end
