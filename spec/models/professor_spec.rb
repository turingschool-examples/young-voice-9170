require 'rails_helper'

RSpec.describe Professor, type: :model do
  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :age}
    it {should validate_presence_of :specialty}
  end

  describe 'relationships' do
    it {should have_many :professor_students}
    it {should have_many(:students).through(:professor_students)}
  end

  describe 'instance methods' do
    describe '#avg_student_age' do
      before(:each) do
        @snape = Professor.create!(name: "Severus Snape", age: 40, specialty: "Potions")
        @lupin = Professor.create!(name: "Remus Lupin", age: 50 , specialty: "Defense Against The Dark Arts")

        @harry = Student.create!(name: "Harry Potter" , age: 15 , house: "Gryffindor" )
        @longbottom = Student.create!(name: "Neville Longbottom" , age: 10 , house: "Gryffindor" )
        @malfoy = Student.create(name: "Draco Malfoy" , age: 12 , house: "Slytherin" )

        ProfessorStudent.create(student_id: @harry.id, professor_id: @snape.id)
        ProfessorStudent.create(student_id: @longbottom.id, professor_id: @snape.id)
      end

      it 'gives avg age of students professor has' do
        expect(@snape.avg_student_age).to eq(12.5)
      end
    end
  end
end
