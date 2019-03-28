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
      if grocery == coupon[:item] && info[:count] >= coupon[:num]
        cart[grocery][:count] = cart[grocery][:count] - coupon[:num]
        if new_cart[grocery + " W/COUPON"]
          new_cart[grocery + " W/COUPON"][:count] += 1
        else
          new_cart[grocery + " W/COUPON"] = {:price => coupon[:cost], :clearance => cart[grocery][:clearance], :count => 1}
        end
      end
    }
    new_cart[grocery] = info
  }
  new_cart
end

def apply_clearance(cart)
  cart.each { |grocery, info|
    info.each { |key, value|
      if key == :clearance && :value == true
        cart[grocery][:clearance] == true
      cart[grocery][:price] = (cart[grocery][:price]).to_i * 0.80
    end
    cart
  }
end

def checkout(cart, coupons)
  # code here
end
