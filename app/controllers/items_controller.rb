class ItemsController < ApplicationController
  
  def new
    @item = Item.new  
  end
  
  def create
    @item = current_user.items.new(items_params)
    
    @new_item = Item.new
    
    if @item.save
      flash.now[:notice] = "Objective successfully added."
    else
      flash.now[:error] = "Objective failed to add."
    end
    
    respond_to do |format|
      format.html
      format.js
    end
  end
  
  def destroy
    @item = Item.find(params[:id])
    
    if @item.destroy
      flash.now[:notice] = "Objective successfully completed."
    else
      flash.now[:error] = "Objective failed to complete."
    end
    
    respond_to do |format|
      format.html
      format.js
    end
  end
  
  private
  
  def items_params
    params.require(:item).permit(:name)
  end
  
end