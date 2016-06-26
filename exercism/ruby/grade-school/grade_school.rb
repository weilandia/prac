class School
  VERSION = 1

  attr_reader :database
  def initialize
    @database = {}
  end

  def add(student, grade)
    if database[grade]
      database[grade] << student
      database[grade].sort!
    else
      database[grade] = [student]
    end
  end

  def grade(grade)
    database[grade] ? database[grade] : []
  end

  def to_h
    database.sort.to_h
  end
end
