require 'rails_helper'

describe Gpa::CalculateGpaService do
  context "#calculate_gpa" do
    it "returns calculate_gpa 10 for EXAM: 6, CCH: 4" do
      exam = 6
      cch = 4
      final_average = 5

      expect(described_class.call(exam: exam, cch: cch)).to eq(final_average)
    end
  end
end
