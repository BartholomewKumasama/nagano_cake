class Public::ItemsController < ApplicationController
<<<<<<< HEAD:app/controllers/publics/items_controller.rb
  
=======

>>>>>>> origin/develop:app/controllers/public/items_controller.rb
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
