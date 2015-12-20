class ItemsController < ApplicationController
  
  def new
    @item = Item.new  
  end
  
  def create
    @item = current_user.items.build(items_params)
    
    @new_item = Item.new
    
    if @item.save
      flash[:notice] = "Objective successfully added."
      #redirect_to user_path(current_user)
    else
      flash[:error] = "Objective failed to add."
      #redirect_to user_path(current_user)
    end
    
    respond_to do |format|
      format.html
      format.js
    end
  end
  
  def destroy
    @item = Item.find(params[:id])
    
    if @item.destroy
      flash[:notice] = "Objective successfully completed."
    else
      flash[:error] = "Objective failed to complete."
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