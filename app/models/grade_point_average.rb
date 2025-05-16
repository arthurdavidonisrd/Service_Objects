class GradePointAverage < ApplicationRecord
  before_save :calculate_gpa

  def calculate_gpa
    self.calculate_gpa = GradePointAverage::CalculateGpa.call(exam: exam, cch: cch)
    # self.final_average = (exam + cch) / 2
  end
end
