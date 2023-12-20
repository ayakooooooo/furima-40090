class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_item, only: [:index, :create]

  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @order_address = OrderAddress.new
    # OrderAddressというフォームオブジェクトのインスタンスを生成し、それを@order_addressというインスタンス変数に代入
  end

  def create
    @order_address = OrderAddress.new(order_address_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render :index, status: :unprocessable_entity
    end
  end

  private

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] # 自身のPAY.JPテスト秘密鍵を記述しましょう
    # Payjpクラスのapi_keyというインスタンスに秘密鍵を代入
    Payjp::Charge.create( # 決済に必要な情報は同様にGemが提供する、Payjp::Charge.createというクラスおよびクラスメソッドを使用
      amount: @item.price, # 商品の値段
      card: order_address_params[:token], # カードトークン
      currency: 'jpy' # 通貨の種類（日本円）
    )
  end

  def find_item
    @item = Item.find(params[:item_id])
    # paramsハッシュからitem_idを取得し、それに対応するItemレコードをデータベースから検索
    redirect_to root_path if current_user.id == @item.user_id || @item.order.present?
    # 現在のユーザーがアイテムの所有者であるか、またはアイテムが既に購入されている場合、ルートパス（トップページ）にリダイレクト
  end

  def order_address_params
  params.require(:order_address).permit(:post_code, :prefecture_id, :city, :block, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end
end
