class Product < ApplicationRecord
  def full_product
    "#{price} : #{description}" 
  end

  def friendly_created_at
  created_at.strftime("%A, %d %b %Y %l:%M %p")
  end

  def is_discounted? 
    if price < 10 
      true 
    else 
      false 
    end
  end

  def tax 
    price * 0.09 
  end 

end
