class FrontController < ApplicationController
  def index
    @items = Item.where(buyer_id: nil)
    @image = ItemImage.all
  end

end
