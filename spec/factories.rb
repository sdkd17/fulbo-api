FactoryBot.define do
  
  # factory :user do
  #   nickname {"@ante_34"}
  #   email {"ante43@gmail.com"}
  #   name {"Giannis Antetokounmpo"}
  #   phones {["093939393"]}
  #   type {"Player"}
  #   description {""}
  # end  

  factory :player do
    nickname {"@ante_34"}
    email {"ante43@gmail.com"}
    name {"Giannis Antetokounmpo"}
    phones {["093939393"]}
    type {"Player"}
    description {""}
  end

  factory :owner do
    nickname {"@sdkd17"}
    email {"sdkd17@gmail.com"}
    name {"Sergio Klein"}
    phones {["091641733"]}
    type {"Owner"}
    description {""}
  end

  factory :local do
  	name {"local_1"}
  	address {"adress 123"}
  	phones {["123456789"]}
  	email {"local1@email.com"}
  	opens {Date.new(2019, 01, 01, 15)}
  	closes {Date.new(2019, 01, 01, 22)}
  	owner_id {Owner.all.first.id}
  end


  factory :five do
  	number {1}
  	size {"20x50"}
  	indoor {true}
  	local_id {Local.all.first.id}
  	type {"Five"}
  end

end