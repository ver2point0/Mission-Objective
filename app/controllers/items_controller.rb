class ItemsController < ApplicationController
  
  def new
    @item = Item.new  
  end
  
  def create
    @item = current_user.items.build(items_params)
    
    if @item.save
      flash[:notice] = "Objective successfully added."
      redirect_to user_path(current_user)
    else
      flash[:notice] = "Objective failed to add."
      redirect_to user_path(current_user)
    end 
  end
  
  private
  
  def items_params
    params.require(:item).permit(:name)
  end
  
end