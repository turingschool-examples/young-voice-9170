class Student <ApplicationRecord
  has_many :professor_students
  has_many :professors, through: :professor_students

  validates_presence_of :name
  validates_presence_of :age
  validates_presence_of :house

  def professor_count
    self.professors.count 
  end
end
