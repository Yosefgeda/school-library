require_relative 'person'
require_relative 'classroom'

class Student < Person
  attr_reader :classroom

  def classroom=(classroom)
    @classroom = classroom
    classroom.student.push(self) unless classroom.students.include?(self)
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end
