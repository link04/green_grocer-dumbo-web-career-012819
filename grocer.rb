require 'pry'

def consolidate_cart(cart)
  new_hash = {}
  cart.each do |item|
    item.each do |key, value|
      if new_hash[key]
        new_hash[key][:count] += 1
      else
        new_hash[key] = value
        new_hash[key][:count] = 1
      end
    end
  end
  new_hash
end

def apply_coupons(cart, coupons)
  new_hash = {}
  if coupons.length > 0
    coupons.each do |coupon|
      
     if coupon.keys[0] == cart[coupon.keys[0]]
       
     end
      
    end
    new_hash
  else
    cart
  end
 
end

def apply_clearance(cart)
  cart.each do |item, details|
    if details[:clearance] == true
      discount =  20.to_f * details[:price].to_f / 100.0.round
      details[:price] -= discount
    end
  end
end

def checkout(cart, coupons)
  total = 0
 
  items = consolidate_cart(cart)
  items = apply_coupons(items, coupons)  
  items = apply_clearance(items)
  
  items.each do |item, details|
    total += (details[:price] * details[:count])
  end
  total > 100 ? total - 10.to_f * total.to_f / 100.0 : total
  
end

