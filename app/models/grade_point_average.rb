class GradePointAverage < ApplicationRecord
  def calculate_gpa
    self.final_average = (exam + cch) / 2
  end
end
