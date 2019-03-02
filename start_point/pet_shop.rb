def pet_shop_name(pet_shop)
  return pet_shop[:name]
end

def total_cash(pet_shop)
 return pet_shop[:admin][:total_cash]
end

def add_or_remove_cash(pet_shop,cash)
  pet_shop[:admin][:total_cash] += cash
end

def pets_sold(pet_shop)
  return pet_shop[:admin][:pets_sold]
end

def increase_pets_sold(pet_shop,pets_sold)
  pet_shop[:admin][:pets_sold] += pets_sold
end

def stock_count(pet_shop)
  return pet_shop[:pets].length
end

def pets_by_breed(pet_shop, breed)
  pet_shop[:pets].select {|animal| animal[:breed] == breed}
end

def find_pet_by_name(pet_shop, pet_name)
  pet_shop[:pets].find {|animal| animal[:name] == pet_name}
end


def remove_pet_by_name(pet_shop, pet_name)
  pet_shop[:pets].reject! {|animal| animal[:name] == pet_name}
end

def add_pet_to_stock(pet_shop, new_pet_hash)
  pet_shop[:pets].push(new_pet_hash)
end

def customer_cash(customer)
  return customer[:cash]
end

def remove_customer_cash(customer, cash)
  customer[:cash] -= cash
end

def customer_pet_count(customer)
  return customer[:pets].length
end

def add_pet_to_customer(customer, new_pet)
  customer[:pets].push(new_pet)
end

def customer_can_afford_pet(customer, new_pet)
  customer_cash(customer) >= new_pet[:price]
end

def sell_pet_to_customer(pet_shop, pet, customer)

  if pet != nil && customer_can_afford_pet(customer, pet)
    add_pet_to_customer(customer, pet)
    remove_pet_by_name(pet_shop, pet)
    increase_pets_sold(pet_shop,1)
    remove_customer_cash(customer, pet[:price])
    add_or_remove_cash(pet_shop,pet[:price])
  end

end
