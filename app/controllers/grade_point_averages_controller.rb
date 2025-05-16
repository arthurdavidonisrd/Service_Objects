class GradePointAveragesController < ApplicationController
  before_action :set_grade_point_average, only: %i[ show edit update destroy ]

  def index
    @grade_point_averages = GradePointAverage.all
  end

  def show; end

  def new
    @grade_point_average = GradePointAverage.new
  end

  def edit; end

  def create
    @grade_point_average = GradePointAverage.new(grade_point_average_params)
    @grade_point_average.calculate_gpa

    if @grade_point_average.save
      redirect_to @grade_point_average, notice: "Grade point average was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end


  def update
      if @grade_point_average.update(grade_point_average_params)
        redirect_to @grade_point_average, notice: "Grade point average was successfully updated."
      else
        render :edit, status: :unprocessable_entity
      end
  end

  def destroy
    @grade_point_average.destroy!

    redirect_to grade_point_averages_path, status: :see_other, notice: "Grade point average was successfully destroyed."
  end

  private
    def set_grade_point_average
      @grade_point_average = GradePointAverage.find(params.expect(:id))
    end

    def grade_point_average_params
      params.expect(grade_point_average: [ :exam, :cch, :final_average ])
    end
end
