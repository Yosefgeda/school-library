require './nameable'

class Person < Nameable
  def initialize(age, name = 'unknown', parent_permission: true)
    super()
    @name = name
    @age = age
    @parent_permission = parent_permission
  end
  attr_accessor :name, :age
  attr_reader :id

  def can_use_services?
    of_age? || @parent_permission == true
  end

  def correct_name
    @name
  end

  private

  def of_age?
    return true if @age >= 18

    false
  end
end

class Decorator < Nameable
  def initialize(nameable)
    super()
    @nameable = nameable
  end

  def correct_name
    @nameable.correct_name
  end
end

class CapitalizeDecorator < Decorator
  def correct_name
    @nameable.correct_name.capitalize
  end
end

class TrimmerDecorator < Decorator
  def correct_name
    if @nameable.correct_name.length > 10
      @nameable.correct_name.slice(0, 10)
    else
      @nameable.correct_name
    end
  end
end

person = Person.new(22, 'maximilianus')
puts person.correct_name # maximilianus

capitalized_person = CapitalizeDecorator.new(person)
puts capitalized_person.correct_name # MAXIMILIANUS

capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
puts capitalized_trimmed_person.correct_name # MAXIMILIAN
