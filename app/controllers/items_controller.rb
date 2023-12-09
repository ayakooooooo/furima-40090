class ItemsController < ApplicationController
  def index
  end
  
  private

  def message_params
    params.require(:item).permit(:image, :product_name, :description, :category_id, :status_id, :shipping_cost_id, :prefecture_id, :shipping_date_id, :price).merge(user_id: current_user.id)
  end
end
