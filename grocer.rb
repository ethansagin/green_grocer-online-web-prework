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
  new_cart = {}
  cart.each { |grocery, info|
    coupons.each { |coupon|
      if grocery = coupon[:item] && info[:count] >= coupon[:num]
        grocery = 
        
end

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end
