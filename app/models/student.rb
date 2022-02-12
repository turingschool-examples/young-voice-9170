class Student <ApplicationRecord
  has_many :professor_students
  has_many :professors, through: :professor_students
  validates_presence_of :name
  validates_presence_of :age
  validates_presence_of :house

  def count_professors
    self.professors.count
  end

  def self.alphabetize
    order(:name)
  end
end
