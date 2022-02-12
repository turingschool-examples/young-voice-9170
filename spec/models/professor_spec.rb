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
    before(:each) do
      @snape = Professor.create(name: "Severus Snape", age: 45, specialty: "Potions")
      @hagarid = Professor.create(name: "Rubeus Hagrid", age: 38 , specialty: "Care of Magical Creatures")
      @lupin = Professor.create(name: "Remus Lupin", age: 49 , specialty: "Defense Against The Dark Arts")

      @harry = @snape.students.create(name: "Harry Potter" , age: 11 , house: "Gryffindor" )
      @harry = @hagarid.students.create(name: "Harry Potter" , age: 11 , house: "Gryffindor" )
      @malfoy = @snape.students.create(name: "Draco Malfoy" , age: 12 , house: "Slytherin" )
      @longbottom = @lupin.students.create(name: "Neville Longbottom" , age: 11 , house: "Gryffindor" )
    end

    it '#avg_student_age' do
      expect(@snape.avg_student_age).to eq(11.5)
      expect(@hagarid.avg_student_age).to eq(11)
      expect(@lupin.avg_student_age).to eq(11)
    end
  end

  describe 'class methods' do
    before(:each) do
      @snape = Professor.create(name: "Severus Snape", age: 45, specialty: "Potions")
      @hagarid = Professor.create(name: "Rubeus Hagrid", age: 38 , specialty: "Care of Magical Creatures")
      @lupin = Professor.create(name: "Remus Lupin", age: 49 , specialty: "Defense Against The Dark Arts")

      @harry = @snape.students.create(name: "Harry Potter" , age: 11 , house: "Gryffindor" )
      @harry = @hagarid.students.create(name: "Harry Potter" , age: 11 , house: "Gryffindor" )
      @malfoy = @snape.students.create(name: "Draco Malfoy" , age: 12 , house: "Slytherin" )
      @longbottom = @lupin.students.create(name: "Neville Longbottom" , age: 11 , house: "Gryffindor" )
    end

    it 'self#alphabetize' do
      expect(Professor.all).to eq([@snape, @hagarid, @lupin])
      expect(Professor.alphabetize).to eq([@lupin, @hagarid, @snape])
    end
  end
end
