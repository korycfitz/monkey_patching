class Bootcamp
  def initialize(name, slogan, student_capacity)
    @name = name                        #string
    @slogan = slogan                    #string
    @student_capacity = student_capacity #integer
    @teachers = []
    @students = []
    @grades = Hash.new { |hash, k| hash[k] = [] } #hash of empty arrays
  end

  def name
    @name
  end

  def slogan
    @slogan
  end

  def teachers
    @teachers
  end

  def students
    @students
  end

  def hire(teacher)
    @teachers << teacher
  end

  def enroll(student)
      length = @students.length

      while length < @student_capacity 
        @students << student
        return true
        length += 1
      end

      return false if length == @student_capacity 
  end

  def enrolled?(student)
    return true if @students.include?(student)
    false
  end

  def student_to_teacher_ratio
    (@students.length/(@teachers.length + 0.0)).round(0, half: :down)
  end

  def add_grade(student, grade)
    if enrolled?(student)
      @grades[student] << grade
      true
    else 
      false
    end
  end

  def num_grades(student)
    @grades[student].length
  end

  def average_grade(student)
    return nil if @grades[student].length == 0
    @grades[student].sum / @grades[student].length
  end

end

