1000.times do 
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name

  contact = Contact.new(
                        first_name: first_name,
                        middle_Name: Faker::Name.middle_name,
                        last_name: last_name,
                        email: Faker::Internet.free_email("#{first_name}.#{last_name}"),
                        phone_number: Faker::PhoneNumber.phone_number,
                        bio: Faker::Hacker.say_something_smart
                        )
  contact.save
end

#rails c
#Contact.all
#rake db:seed
#rails c

#
# system "say Hello"
# contact = Contact.new(first_name: "Jeff", last_name: "Bridges", email: "thedude@rug.org", phone_number: "(310) 555-1234")
# contact.save

# contact = Contact.new(first_name: "Jeff", last_name: "Bridges", email: "thedude@rug.org", phone_number: "(310) 555-1234")
# contact.save

# contact = Contact.new(first_name: "Jeff", last_name: "Bridges", email: "thedude@rug.org", phone_number: "(310) 555-1234")
# contact.save

# contact = Contact.new(first_name: "Jeff", last_name: "Bridges", email: "thedude@rug.org", phone_number: "(310) 555-1234")
# contact.save

# contact = Contact.new(first_name: "Jeff", last_name: "Bridges", email: "thedude@rug.org", phone_number: "(310) 555-1234")
# contact.save