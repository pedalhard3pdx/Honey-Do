Factory.define :user do |user|
  user.name                   "Matt Cordeiro"
  user.email                  "mcord@example.com"	
  user.password               "foobar"
  user.password_confirmation  "foobar"
end

Factory.sequence :email do |n|
  "person-#{n}@example.com"
end

Factory.define :list do |list|
  list.list_name   "Groceries"
  list.list_item1  "Milk"
  list.list_item2  "Bread"
  list.association :user
end
