class ItemsController < ApplicationController
  before_action :set_parents, only: [:new, :create]
  
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
    @item.item_images.new
  end

  def create
    if Brand.find_by(name: params[:item][:brand_name])
      brand = Brand.find_by(name: params[:item][:brand_name])
    else
      brand = Brand.create(name: params[:item][:brand_name])
    end
    
    item = Item.new(item_params)
    item.brand_id = brand.id
    if item.save!
    else
      @item = Item.new
      render :new
    end
  end

  def show
    @items = Item.all
  end
  def search
    #ajax通信を開始
    respond_to do |format|
      format.html
      format.json do
        if params[:parent_id]
          @childrens = Category.find(params[:parent_id]).children
        elsif params[:children_id]
          @grandChilds = Category.find(params[:children_id]).children
        end
      end
    end
  end

  private
  def brand_params
    params.require(:item).permit(:brand_name)
  end
  def item_params
    params.require(:item).permit(:name, :introduction, :price, :category_id, :brand_id, :size_id, :condition_id, :preparation_day_id, :postage_payer_id, :prefecture_id, item_images_attributes: [:image]).merge(user_id: current_user.id)
  end

  def set_parents
    @parents = Category.where(ancestry: nil)
  end

  def show
  end
end
