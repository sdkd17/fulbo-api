FactoryBot.define do
  # factory :relationship_invitation do
  #   invitator_id { 1 }
  #   invited_id { 1 }
  #   reservation { nil }
  #   confirmed { false }
  # end

  
  # factory :user do
  #   nickname {"@ante_34"}
  #   email {"ante43@gmail.com"}
  #   name {"Giannis Antetokounmpo"}
  #   phones {["093939393"]}
  #   type {"Player"}
  #   description {""}
  # end  

  factory :player do

    sequence( :nickname ) { |n| "player_#{n}" }
    sequence( :email ) { |n| "emailPlayer#{n}@mail.com" }
    # nickname {"@ante_34"}
    # email {"ante43@gmail.com"}
    name {"Giannis Antetokounmpo"}
    phones {["093939393"]}
    type {"Player"}
    description {""}
  end

  factory :owner do
    sequence( :nickname ) { |n| "owner_#{n}" }
    sequence( :email ) { |n| "emailOwner#{n}@mail.com" }
    name {"Sergio Klein"}
    phones {["091641733"]}
    type {"Owner"}
    description {""}
  end

  factory :local do
  	association :owner, factory: :owner 

    sequence( :name ) { |n| "local_#{n}" }
    sequence( :email ) { |n| "local#{n}@mail.com" }
  	address {"adress 123"}
  	phones {["123456789"]}
  	opens {Date.new(2019, 01, 01, 15)}
  	closes {Date.new(2019, 01, 01, 22)}

  end


  factory :five do
  	sequence ( :number ) { |n| n}
  	size {"20x50"}
  	indoor {true}
    association :local, factory: :local
  	# local_id {Local.all.first.id}
  	type {"Five"}
  end


  factory :reservation do
    player_id {Player.all.first}
    court_id {Court.all.first} 
    date {DateTime.new(2019,02, 19, 20)}

  end

end