# frozen_string_literal: true

US_STATES = ["Alaska", "Alabama", "Arkansas", "Arizona", "California", "Colorado", "Connecticut", "District of Columbia", "Delaware", "Florida", "Georgia", "Hawaii", "Iowa", "Idaho", "Illinois", "Indiana", "Kansas", "Kentucky", "Louisiana", "Massachusetts", "Maryland", "Maine", "Michigan", "Minnesota", "Missouri", "Mississippi", "Montana", "North Carolina", "North Dakota", "Nebraska", "New Hampshire", "New Jersey", "New Mexico", "Nevada", "New York", "Ohio", "Oklahoma", "Oregon", "Pennsylvania", "Rhode Island", "South Carolina", "South Dakota", "Tennessee", "Texas", "Utah", "Virginia", "Vermont", "Washington", "Wisconsin", "West Virginia", "Wyoming"]

puts '------------Creating States---------------'

US_STATES.each do |state|
  State.find_or_create_by(name: state)
end

puts '------------States created----------------'


puts '------------Creating Roles----------------'

%w[buyer seller].each do |role|
  Role.find_or_create_by(name: role)
end

puts '------------Roles created----------------'

puts '------------Creating Product Type----------------'

%w[Orange Apple Banana].each do |type|
  ProductType.find_or_create_by(name: type)
end

puts '------------Product Type created----------------'


