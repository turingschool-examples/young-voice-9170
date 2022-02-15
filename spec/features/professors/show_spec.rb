require 'rails_helper'

RSpec.describe 'professor show page' do

  before(:each) do
    @snape = Professor.create(name: "Severus Snape", age: 45, specialty: "Potions")
    @lupin = Professor.create(name: "Remus Lupin", age: 49 , specialty: "Defense Against The Dark Arts")

    @harry = @snape.students.create(name: "Harry Potter" , age: 11 , house: "Gryffindor" )
    @longbottom = @snape.students.create(name: "Neville Longbottom" , age: 11 , house: "Gryffindor" )
    @malfoy = @lupin.students.create(name: "Draco Malfoy" , age: 12 , house: "Slytherin" )
    
    visit "/professors/#{@snape.id}"
  end
  
  scenario 'visitor sees names of students associated with that professor' do
    expect(page).to have_content(@harry.name)
    expect(page).to have_content(@longbottom.name)
    expect(page).to_not have_content(@malfoy.name)
  end
end