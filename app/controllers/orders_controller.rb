class OrdersController < ApplicationController
  include ActionView::Helpers::TextHelper

  def index
    @orders = Order.all
  end

  def create
    order = Order.new(user_id: User.find(params[:user_id].to_i).id)
    @briefcase.contents.each do |power_id, quantity|
      order.powers << Power.find(power_id)
    end

    if order.save
      session[:briefcase] = nil
      flash[:notice] = "Your order was saved! You saved #{@briefcase.powers.count} powers."
      redirect_to order_path(order)
    else
    end
  end

  def show

  end
end
