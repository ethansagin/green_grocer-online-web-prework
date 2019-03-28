  coupons.each { |coup_hsh|
    fruit_name = coup_hsh[:item]
    new_coup_hsh = {
      :price => coup_hsh[:cost],
      :clearance => true,
      :count => 0}
    if cart.key?(fruit_name)
      cart[fruit_name][:clearance] = new_coup_hsh[:clearance]
      if cart[fruit_name][:count] >= coup_hsh[:num]
        new_coup_hsh[:count] = cart[fruit_name][:count] / coup_hsh[:num]
        cart[fruit_name][:count] = cart[fruit_name][:count] % coup_hsh[:num]
      end
      cart[fruit_name + " W/COUPON"] = new_coup_hsh
    end
  }
  cart