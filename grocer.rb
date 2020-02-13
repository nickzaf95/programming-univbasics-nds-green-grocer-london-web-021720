require 'pp'

def find_item_by_name_in_collection(name, collection)
  # Implement me first!
  #
  # Consult README for inputs and outputs
  i = 0 
  while i < collection.size do 
    if collection[i][:item] == name
      return collection[i]
    end
    i += 1 
  end
end

def consolidate_cart(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This returns a new Array that represents the cart. Don't merely
  # change `cart` (i.e. mutate) it. It's easier to return a new thing.
  i = 0 
  arr = []
  while i < cart.size do 
    if find_item_by_name_in_collection(cart[i][:item], arr) == nil 
      arr << cart[i]
      arr[-1][:count] = 1 
    else
      item_name = find_item_by_name_in_collection(cart[i][:item], arr)[:item]
      j = 0 
      while j < arr.size do
        if arr[j][:item] == item_name
          arr[j][:count] += 1 
        end
        j += 1 
      end
    end
    i += 1 
  end
  arr
end

def apply_coupons(cart, coupons)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
  
  new_cart = consolidate_cart(cart)
  i = 0 
  pp new_cart
  while i < coupons.size do
    item_name = coupons[i][:item]
    item_name_with_coupon = "#{item_name} W/COUPON"
    ru = find_item_by_name_in_collection(item_name,new_cart)
    brem = find_item_by_name_in_collection(item_name_with_coupon,new_cart)
    #pp ru
    #pp brem
    #pp new_cart
    if ru == nil
    elsif brem == nil
      new_cart << ru
      new_cart[-1][:item] = "#{item_name} W/COUPON"
      new_cart[-1][:count] = coupons[i][:num]
      number = coupons[i][:num]
      cost = coupons[i][:cost]
      new_cart[-1][:price] = cost / number
      j = 0 
      while j < (new_cart.size - 1) do
        if new_cart[j][:item] == item_name
          new_cart[j][:count] -= number
        end
        j += 1 
        
      end
    else
      number = coupons[i][:num]
      j = 0 
      while j < (new_cart.size - 1) do
        if new_cart[j][:item] == item_name_with_coupon
          new_cart[j][:count] += number
        elsif new_cart[j][:item] == item_name
          new_cart[j][:count] -= number
        end
        j += 1 
      end  
    end
    i += 1 
    #pp item_name
    #pp new_cart
    #pp item_name_with_coupon
  end
  #pp new_cart
  new_cart
end

def apply_clearance(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
end

def checkout(cart, coupons)
  # Consult README for inputs and outputs
  #
  # This method should call
  # * consolidate_cart
  # * apply_coupons
  # * apply_clearance
  #
  # BEFORE it begins the work of calculating the total (or else you might have
  # some irritated customers
end
