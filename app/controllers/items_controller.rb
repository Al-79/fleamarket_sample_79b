class ItemsController < ApplicationController
  before_action :set_parents, only: [:new, :create, :edit]
  before_action :set_group, only: [:edit, :show, :destroy]

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
    if item.save
      redirect_to confirmation_item_path(current_user)
    else
      @item = Item.new
      @item.item_images.new
      render :new
    end
  end

  def edit
    @item.item_images.new
  end

  def update
    if Brand.find_by(name: params[:item][:brand_name])
      brand = Brand.find_by(name: params[:item][:brand_name])
    else
      brand = Brand.create(name: params[:item][:brand_name])
    end
    
    item = Item.find(params[:id])
    item.brand_id = brand.id
    item.update(item_params)
  end

  def show
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

  def destroy
    render :show unless @item.destroy
  end
  

  private
  def brand_params
    params.require(:item).permit(:brand_name)
  end
  def item_params
    params.require(:item).permit(:name, :introduction, :price, :category_id, :brand_id, :size_id, :condition_id, :preparation_day_id, :postage_payer_id, :prefecture_id, item_images_attributes: [:image, :id, :_destroy]).merge(user_id: current_user.id)
  end
  def set_parents
    @parents = Category.where(ancestry: nil)
  end
  def set_group
    @item = Item.find(params[:id])
  end

end
