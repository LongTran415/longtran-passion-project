User.destroy_all

users = 20.times.map do
  User.create!( :username  => Faker::Internet.user_name,
                :email      => Faker::Internet.email,
                :password   => 'password' )
end

tags = 20.times.map do
  Tag.create!( :name => Faker::Lorem.word)
end
