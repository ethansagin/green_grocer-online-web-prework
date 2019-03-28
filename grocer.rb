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
    if info[:clearance] == true
      info[:price] = (info[:price] * 0.80).round(2)
    end
    cart
  }
end

def checkout(cart, coupons)
  grand_total = 0
  cart = consolidate_cart(cart)
  cart = apply_coupons(cart, coupons)
  apply_clearance(cart)
  cart.each { |grocery, info|
    grand_total += (info[:price] * info[:count]).round(2)
  }
  if grand_total > 100
    grand_total = grand_total *1.1.round(2)
  else
    grand_total
  end
end
