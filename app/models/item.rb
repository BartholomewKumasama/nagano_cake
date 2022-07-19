class Item < ApplicationRecord
  validates :genre_id, presence: true  #空でないこと
  
  has_one_attached :image
  
  has_many :cart_items,dependent: :destroy
  has_many :order_details,dependent: :destroy
  
  belongs_to :genre
  
  def get_item_image
    (item_image.attached?) ? item_image : 'no_image.jpg'
  end
  
end
