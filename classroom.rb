require './student'

class Classroom
  attr_accessor :lable
  attr_reader :student

  def initialize(lable)
    @lable = lable
    @student = []
  end

  def add_students(student)
    @student.push(student)
    student.classroom = self
  end
end
