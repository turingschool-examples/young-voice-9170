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
    before(:each) do
      @harry = Student.create(name: "Harry Potter" , age: 11 , house: "Gryffindor" )
      @malfoy = Student.create(name: "Draco Malfoy" , age: 12 , house: "Slytherin" )
      @longbottom = Student.create(name: "Neville Longbottom" , age: 11 , house: "Gryffindor" )

      @snape = @harry.professors.create(name: "Severus Snape", age: 45, specialty: "Potions")
      @snape = @malfoy.professors.create(name: "Severus Snape", age: 45, specialty: "Potions")
      @hagarid = @harry.professors.create(name: "Rubeus Hagrid", age: 38 , specialty: "Care of Magical Creatures")
      @lupin = @longbottom.professors.create(name: "Remus Lupin", age: 49 , specialty: "Defense Against The Dark Arts")
    end

    it '#count_professors' do
      expect(@harry.count_professors).to eq(2)
      expect(@malfoy.count_professors).to eq(1)
      expect(@longbottom.count_professors).to eq(1)
    end
  end

end
