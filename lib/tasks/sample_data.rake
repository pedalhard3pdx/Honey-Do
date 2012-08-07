
namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    admin = User.create!(:name => "Example User",
                         :email => "example@railstutorial.org",
                         :password => "foobar",
                         :password_confirmation => "foobar")
    admin.toggle!(:admin)
    99.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      User.create!(:name => name,
                   :email => email,
                   :password => password,
                   :password_confirmation => password)
    end

    User.all(:limit => 6).each do |user|
      50.times do
        user.lists.create!(:list_name => Faker::Lorem.words(2),  
                           :list_item1 => Faker::Lorem.words(2), 
                           :list_item2 => Faker::Lorem.words(2), 
                           :list_item3 => Faker::Lorem.words(2), 
                           :list_item4 => Faker::Lorem.words(2), 
                           :list_item5 => Faker::Lorem.words(2), 
                           :list_item6 => Faker::Lorem.words(2), 
                           :list_item7 => Faker::Lorem.words(2), 
                           :list_item8 => Faker::Lorem.words(2), 
                           :list_item9 => Faker::Lorem.words(2), 
                           :list_item10 => Faker::Lorem.words(2))
      end
    end
  end
end