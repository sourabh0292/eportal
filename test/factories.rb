FactoryGirl.define do

  

  factory :cart do
  end

  factory :order do
    name {Faker::Name.name}
    address { Faker::Address.street_address }
    mobile {Faker::PhoneNumber.cell_phone}
    pincode { Faker::Address.postcode}
    created_at { Faker::Time.between(80.days.ago, Date.today, :all)}
    trait :with_association do
      before :create do
        FactoryGirl.create :user
      end
      product {(Product.find( rand( Product.first.id..Product.last.id ) )).to_json}
      user User.last
      price { rand(1000..10000)}
    end
  end

  factory :product do
    trait :book do
      name {Faker::Book.title}
      description {Faker::Book.genre}
      category "Books"
      image File.new(Rails.root.join('app', 'assets','images', 'book.jpg'))
    end
    trait :shoe do
      name {Faker::Company.name}
      description {Faker::Color.color_name}
      category "Shoes"
      image File.new(Rails.root.join('app', 'assets','images', 'shoe.jpg'))
    end
    trait :shirt do
      name {Faker::Company.name}
      description {Faker::Color.color_name}
      category "Shirts"
      image File.new(Rails.root.join('app', 'assets','images', 'tshirt.jpeg'))
    end

    trait :jacket do
      name {Faker::Company.name}
      description {Faker::Color.color_name}
      category "Jackets"
      image File.new(Rails.root.join('app', 'assets','images', 'jacket.jpg'))
    end

    trait :watch do
      name {Faker::Company.name}
      description {Faker::Color.color_name}
      category "Watches"
      image File.new(Rails.root.join('app', 'assets','images', 'watch.jpg'))
    end

    trait :headphones do
      name {Faker::Company.name}
      description {Faker::Color.color_name}
      category "Headphones"
      image File.new(Rails.root.join('app', 'assets','images', 'headphones.jpg'))
    end
    price { rand(1000..5000) }
  end

end
