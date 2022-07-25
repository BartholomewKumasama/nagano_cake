class Public::GenresController < ApplicationController
  
  def show
    @genre = Genre.find(params[:id])
    @items = @genre.item.where(is_active: true)
    @genres = Genre.all
  end
  
end
