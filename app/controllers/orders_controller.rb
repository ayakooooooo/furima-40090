class OrdersController < ApplicationController
  def index
    @order_address = OrderAddress.new
    # OrderAddressというフォームオブジェクトのインスタンスを生成し、それを@order_addressというインスタンス変数に代入
  end
end
