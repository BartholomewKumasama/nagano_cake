class Public::ItemsController < ApplicationController
<<<<<<< HEAD
  
=======

>>>>>>> origin/develop
  def index
    @genre = Genre.all
    @items = Item.all.where(is_active: true)

  end

  def show
    @genre = Genre.all
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end

  private
  def item_params
    params.require(:product).permit(:name,:introduction,:price,:image)
  end
end
