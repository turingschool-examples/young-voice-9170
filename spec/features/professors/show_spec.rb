require 'rails_helper'

RSpec.describe 'professor show page' do

  before(:each) do
    @snape = Professor.create!(name: "Severus Snape", age: 40, specialty: "Potions")
    @lupin = Professor.create!(name: "Remus Lupin", age: 50 , specialty: "Defense Against The Dark Arts")

    @harry = Student.create!(name: "Harry Potter" , age: 15 , house: "Gryffindor" )
    @longbottom = Student.create!(name: "Neville Longbottom" , age: 10 , house: "Gryffindor" )
    @malfoy = Student.create(name: "Draco Malfoy" , age: 12 , house: "Slytherin" )

    ProfessorStudent.create(student_id: @harry.id, professor_id: @snape.id)
    ProfessorStudent.create(student_id: @longbottom.id, professor_id: @snape.id)
    
    visit "/professors/#{@snape.id}"
  end
  
  scenario 'visitor sees names of students associated with that professor' do
    expect(page).to have_content(@harry.name)
    expect(page).to have_content(@longbottom.name)
    expect(page).to_not have_content(@malfoy.name)
  end

  scenario 'visitor sees average age of all students for professor' do
    expect(page).to have_content(@snape.avg_student_age)
  end

end