
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

    users = User.all(limit: 6)
      50.times do
        content = Faker::Lorem.sentence(2) 
        users.each { |user| user.lists.create!(list_name: content, list_item1: content,  
                                               list_item2: content, list_item3: content,
                                               list_item4: content, list_item5: content,  
                                               list_item6: content, list_item7: content,
                                               list_item8: content, list_item9: content,
                                               list_item10: content) }
    end
  end
end