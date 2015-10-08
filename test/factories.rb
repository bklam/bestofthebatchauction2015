FactoryGirl.define do
  factory :tag do
    name: "Steelers"
  end

  factory :item_tag
  end

  factory :photo
    file_name: "Default Photo"
    mime_type: "image/jpeg"
  end

  factory :bid
    amount: 20.00
    bid_time: DateTime.now - 5.minutes
  end

  factory :user
    barcode_num: "1c395a"
    email: "user@example.com"
    first_name: "Jane"
    last_name: "Doe"
    phone_num: "1234567890"
  end

  factory :status
    description: "Active"
    status_type: "A"
  end

  factory :item
    name: "Troy Polamalu Jersey"
    current_price: 100.00
    description: "Official Steelers \#43"
    donated_by: "Pittsburgh Steelers"
    min_increment: 20.00
    starting_price: 40.00
  end
end
