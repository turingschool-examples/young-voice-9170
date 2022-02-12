require 'rails_helper'

RSpec.describe "students index page", type: :feature do
  before(:each) do
    @harry = Student.create(name: "Harry Potter" , age: 11 , house: "Gryffindor" )
    @malfoy = Student.create(name: "Draco Malfoy" , age: 12 , house: "Slytherin" )
    @longbottom = Student.create(name: "Neville Longbottom" , age: 11 , house: "Gryffindor" )

    @snape = @harry.professors.create(name: "Severus Snape", age: 45, specialty: "Potions")
    @snape = @malfoy.professors.create(name: "Severus Snape", age: 45, specialty: "Potions")
    @hagarid = @harry.professors.create(name: "Rubeus Hagrid", age: 38 , specialty: "Care of Magical Creatures")
    @lupin = @longbottom.professors.create(name: "Remus Lupin", age: 49 , specialty: "Defense Against The Dark Arts")
  end

  scenario "visitor sees list of students names, and their number of professors" do
    visit '/students'
    expect(current_path).to eq('/students')
    expect(page).to have_content(@harry.name)
    expect(page).to have_content(@malfoy.name)
    expect(page).to have_content(@longbottom.name)
    expect(page).to have_content("Harry Potter: 2")
    expect(page).to have_content("Draco Malfoy: 1")
    expect(page).to have_content("Neville Longbottom: 1")
  end
end
