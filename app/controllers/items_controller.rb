class ItemsController < ApplicationController
  
  def create
    @item = Item.new
    @item.name = params[:item][:name]
  end
  
end
