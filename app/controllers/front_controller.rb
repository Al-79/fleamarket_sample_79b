class FrontController < ApplicationController
  def index
    # @parents = Category.where(ancestry: nul)
    @items = Item.where(buyer_id: nil)
    @image = ItemImage.all
  end

end
