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

  def create
    @item = Item.new(item_params)
    if @item.save
      # 保存成功の処理
      redirect_to root_path
    else
      # バリデーションが通過しない場合の処理
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :product_name, :description, :category_id, :status_id, :shipping_cost_id, :prefecture_id, :shipping_date_id, :price).merge(user_id: current_user.id)
  end
end
