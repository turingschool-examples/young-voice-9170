require 'rails_helper'

RSpec.describe Student, type: :model do

  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :age}
    it {should validate_presence_of :house}
  end

  describe 'relationships' do
    it {should have_many :professor_students}
    it {should have_many(:professors).through(:professor_students)}
  end

  describe 'instance methods' do
    describe '#professor_count' do

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
      end

      it 'counts the number of professors a student has' do
        
        expect(@harry.professor_count).to eq(3)
        expect(@malfoy.professor_count).to eq(2)
        expect(@longbottom.professor_count).to eq(1)
      end
    end
  end
end
