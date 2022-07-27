class Public::ItemsController < ApplicationController

  def index
    @genres = Genre.all
    @items = Item.where(is_active: true).page(params[:page]).per(8)
    @items_all = Item.all.where(is_active: true)

  end

  def show
    @genres = Genre.all
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end


  private
  def item_params
    params.require(:product).permit(:name,:introduction,:price,:image)
  end
end
