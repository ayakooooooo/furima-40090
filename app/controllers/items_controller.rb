class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  # ログインしていないユーザーをログインページの画面に促す

  def index
    @items = Item.order('created_at DESC')
    # 一覧が新規投稿順に並ぶように記述
  end

  def new
    @item = Item.new
  end
  
  private

  def message_params
    params.require(:item).permit(:image, :product_name, :description, :category_id, :status_id, :shipping_cost_id, :prefecture_id, :shipping_date_id, :price).merge(user_id: current_user.id)
  end
end
