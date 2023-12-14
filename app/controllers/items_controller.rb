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
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
      # このstatus: :unprocessable_entity記述によってエラー表示
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    # ユーザーがログインしていて、なお且つそのユーザーが出品者である場合のみ
    if user_signed_in?
      @item = Item.find(params[:id])
      unless current_user.id == @item.user_id
      redirect_to root_path
      end
    end
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :product_name, :description, :category_id, :status_id, :shipping_cost_id, :prefecture_id, :shipping_date_id, :price).merge(user_id: current_user.id)
  end
end
