require 'rails_helper'

RSpec.describe "professor show page", type: :feature do
  before(:each) do
    @snape = Professor.create(name: "Severus Snape", age: 45, specialty: "Potions")
    @hagarid = Professor.create(name: "Rubeus Hagrid", age: 38 , specialty: "Care of Magical Creatures")
    @lupin = Professor.create(name: "Remus Lupin", age: 49 , specialty: "Defense Against The Dark Arts")

    @harry = @snape.students.create(name: "Harry Potter" , age: 11 , house: "Gryffindor" )
    @harry = @hagarid.students.create(name: "Harry Potter" , age: 11 , house: "Gryffindor" )
    @malfoy = @snape.students.create(name: "Draco Malfoy" , age: 12 , house: "Slytherin" )
    @longbottom = @lupin.students.create(name: "Neville Longbottom" , age: 11 , house: "Gryffindor" )
  end

  scenario "visitor sees list of a professors name, age and specialty" do
    visit "/professors/#{@snape.id}"

    expect(current_path).to eq("/professors/#{@snape.id}")
    expect(page).to have_content(@harry.name)
    expect(page).to have_content(@malfoy.name)
    expect(page).to_not have_content(@longbottom.name)

    visit "/professors/#{@hagarid.id}"

    expect(current_path).to eq("/professors/#{@hagarid.id}")
    expect(page).to have_content(@harry.name)
    expect(page).to_not have_content(@malfoy.name)
    expect(page).to_not have_content(@longbottom.name)

    visit "/professors/#{@lupin.id}"

    expect(current_path).to eq("/professors/#{@lupin.id}")
    expect(page).to_not have_content(@harry.name)
    expect(page).to_not have_content(@malfoy.name)
    expect(page).to have_content(@longbottom.name)
  end

  scenario "visitor sees average age of all students for that professor" do
    visit "/professors/#{@snape.id}"

    expect(current_path).to eq("/professors/#{@snape.id}")
    expect(page).to have_content("Average Student Age: 11.5")

    visit "/professors/#{@hagarid.id}"

    expect(current_path).to eq("/professors/#{@hagarid.id}")
    expect(page).to have_content("Average Student Age: 11")

    visit "/professors/#{@lupin.id}"

    expect(current_path).to eq("/professors/#{@lupin.id}")
    expect(page).to have_content("Average Student Age: 11")
  end
end
