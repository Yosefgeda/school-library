require './person'
require './classroom'

class Student < Person
  def initialize(classroom, age, name = 'unknown', parent_permission: true)
    super(age, name, parent_permission)
    @classroom = classroom
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.student.push(self)
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end
