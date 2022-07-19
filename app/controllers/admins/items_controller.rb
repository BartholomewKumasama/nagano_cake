class Admins::ItemsController < ApplicationController
  
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @genres = Genre.all
    if @item.save
      redirect_to admins_item_path(@item)
      flash[:notice] = '新しい商品を登録しました。'
    # else
    # render "new"
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to admins_item_path(@item.id)
      flash[:notice] = '新しい商品を登録しました。'
    # else
    # render "edit"
    end
  end

end

private

  def item_params
  	params.require(:item).permit(:name, :introduction, :genre_id, :price, :is_active, :image)
  end