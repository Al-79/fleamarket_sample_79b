class FrontController < ApplicationController
  def index
    # @parents = Category.where(ancestry: nul)
    @items = Item.all
    @image = ItemImage.all
  end

end
