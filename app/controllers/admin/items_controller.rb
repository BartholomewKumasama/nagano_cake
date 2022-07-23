class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin! #ログイン済ユーザーのみにアクセスを許可する
  
  def index
    @items = Item.all  #.page(params[:page]).per(10)  kaminariインストール後
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @genres = Genre.all
    if @item.save
      redirect_to admin_item_path(@item)
      flash[:notice] = '新しい商品を登録しました。'
    else
    render "new"
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
      redirect_to admin_item_path(@item.id)
      flash[:notice] = '商品情報を編集しました'
    else
      render :"show"
    end
    
  end

end

private

  def item_params
  	params.require(:item).permit(:name, :introduction, :genre_id, :price, :is_active, :image)
  end