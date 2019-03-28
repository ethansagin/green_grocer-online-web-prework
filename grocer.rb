require 'pry'

def consolidate_cart(cart)
  consolidated = {}
  cart.each { |item|
    item.each { |fruit, hsh|
      consolidated[fruit] ||= hsh
      consolidated[fruit][:count] ||= 0
      consolidated[fruit][:count] += 1
    }
  }
  consolidated
end


def apply_coupons(cart, coupons)
  coupons.each { |coup_hsh|
    fruit_name = coup_hsh[:item]
    new_coup_hsh = {
      :price => coup_hsh[:cost],
      :clearance => true,
      :count => 0}
      binding.pry
    if cart.key? == fruit_name
      cart[fruit_name][:clearance] = new_coup_hsh[:clearance]
    if 
      binding.pry
    end
  }
end

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end
