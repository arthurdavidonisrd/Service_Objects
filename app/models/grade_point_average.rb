class GradePointAverage < ApplicationRecord
  before_save :calculate_gpa

  def calculate_gpa
    self.final_average = Gpa::CalculateGpaService.call(exam: exam, cch: cch)
  end
end
