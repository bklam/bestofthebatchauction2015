namespace :db do
  # Populate file and structure taken from PATS
  # First, this populate destroys everything in the database
  # Second, this creates some filters, orgs, and users who are approvers
  # Third, this creates normal users, their keys, their key's rights,
  # their's keys comments, and their keys approvals if applicable

  desc "Erase and fill database"
  # creating a rake task within db namespace called 'populate'
  # executing 'rake db:populate' will cause this script to run
  task :populate => :environment do
    # Need two gems to make this work: faker & populator
    # Docs at: http://populator.rubyforge.org/
    require 'populator'
    # Docs at: http://faker.rubyforge.org/rdoc/
    require 'faker'

    # Step 1: clear any old data in the db
    [User, Item, Photo, Status].each(&:delete_all)

    # Step 2: Add in fake data
    # Fake Tags
    for i in 0..4
        tag = Tag.new
        tag.name = Faker::Lorem.word
        tag.save!
    end
    # Fake Users
    for i in 1..4
        user = User.new
        user.first_name = Faker::Name.first_name
        user.last_name = Faker::Name.last_name
        user.email = Faker::Internet.safe_email(user.first_name)
        user.phone_num = Faker::PhoneNumber.phone_number
        user.barcode_num = Faker::Number.number(10)
        user.save!
    end
    # Fake Items
    for i in 1..6
        item = Item.new
        item.name = Faker::Commerce.product_name
        item.description = Faker::Company.catch_phrase
        item.donated_by = Faker::Company.name
        item.value = rand(50..100)
        item.starting_price = Faker::Number.decimal(2)
        item.current_price = item.starting_price + rand(0..4)
        item.min_increment = (rand(0.01..5.00) * 100).round / 100.0
        item.status_id = rand(1..6)
        item.save!
        # for each item, possibly add photos
        for i in 0..rand(0..3)
            photo = Photo.new
            photo.item_id = item.id
            photo.filename = Faker::Lorem.word
            photo.mime_type = ".jpg"
            # photo.file_contents = 0b10101001
            photo.save!
        end
    end
    # Fake Bids
    for i in 0..20
        bid = Bid.new
        bid.item_id = rand(1..6) # because 6 fake Items
        bid.user_id = rand(1..4) # because 4 fake Users
        bid.bid_time = Faker::Time.between(((i/2.0)+1).hours.ago, Time.now, :all)
        bid.amount = 100 + i
        bid.save!
    end
    # Fake Item_Tags
    for i in 0..10
        item_tag = ItemTag.new
        item_tag.item_id = rand(1..6) # because 6 fake Items
        item_tag.tag_id = rand(1..4) # because 4 fake Tags
        item_tag.save!
    end
    # Fake Status
    for i in 0..5
        status_types = ["available", "featured", "sold", "missing", "paid", "picked up"]
        status = Status.new
        status.status_type = status_types[i]
        status.description = Faker::Lorem.sentence
        status.save!
    end
  end
end
