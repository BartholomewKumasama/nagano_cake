class Genre < ApplicationRecord
  
  has_many :products, dependent: :destroy
  has_many :item    #1:N の「1」側にあたるモデルに、has_many を記載
end
