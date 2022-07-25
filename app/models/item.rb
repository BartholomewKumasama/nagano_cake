class Item < ApplicationRecord
  validates :genre_id, presence: true  #空でないこと
  
  has_one_attached :image
  
  has_many :cart_items,dependent: :destroy
  has_many :order_details,dependent: :destroy
  
  belongs_to :genre
  
  def get_image
    (image.attached?) ? image : 'no_image.jpg'
    
  end
  
   def add_tax_price
        (self.price * 1.10).round
   end
   
  
    
  
   
end
