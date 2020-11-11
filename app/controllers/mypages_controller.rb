class MypagesController < ApplicationController
  def index
  end
  def show
    @items = Item.all
  end
  
end
