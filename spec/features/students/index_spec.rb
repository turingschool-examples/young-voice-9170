require 'rails_helper'

RSpec.describe 'students index page' do
  
  before(:each) do
    @snape = Professor.create!(name: "Severus Snape", age: 45, specialty: "Potions")
    @hagrid = Professor.create!(name: "Rubeus Hagrid", age: 38 , specialty: "Care of Magical Creatures")
    @lupin = Professor.create!(name: "Remus Lupin", age: 49 , specialty: "Defense Against The Dark Arts")

    @malfoy = Student.create(name: "Draco Malfoy" , age: 12 , house: "Slytherin" )
    @harry = Student.create!(name: "Harry Potter" , age: 11 , house: "Gryffindor" )
    @longbottom = Student.create!(name: "Neville Longbottom" , age: 11 , house: "Gryffindor" )
  
    ProfessorStudent.create(student_id: @harry.id, professor_id: @snape.id)
    ProfessorStudent.create(student_id: @harry.id, professor_id: @hagrid.id)
    ProfessorStudent.create(student_id: @harry.id, professor_id: @lupin.id)
    ProfessorStudent.create(student_id: @malfoy.id, professor_id: @hagrid.id)
    ProfessorStudent.create(student_id: @malfoy.id, professor_id: @lupin.id)
    ProfessorStudent.create(student_id: @longbottom.id, professor_id: @snape.id)

    visit '/students'
  end

  scenario 'visitor sees list of students' do
    expect(page).to have_content(@harry.name)
    expect(page).to have_content(@longbottom.name)
    expect(page).to have_content(@malfoy.name)
  end

  scenario 'visitor sees number of professors each student has' do
    expect(page).to have_content("3")
    expect(page).to have_content("2")
    expect(page).to have_content("1")
  end 
end 