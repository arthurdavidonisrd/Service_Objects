class GradePointAveragesController < ApplicationController
  before_action :set_grade_point_average, only: %i[ show edit update destroy ]

  # GET /grade_point_averages or /grade_point_averages.json
  def index
    @grade_point_averages = GradePointAverage.all
  end

  # GET /grade_point_averages/1 or /grade_point_averages/1.json
  def show
  end

  # GET /grade_point_averages/new
  def new
    @grade_point_average = GradePointAverage.new
  end

  # GET /grade_point_averages/1/edit
  def edit
  end

  # POST /grade_point_averages or /grade_point_averages.json
  def create
    @grade_point_average = GradePointAverage.new(grade_point_average_params)

    respond_to do |format|
      if @grade_point_average.save
        format.html { redirect_to @grade_point_average, notice: "Grade point average was successfully created." }
        format.json { render :show, status: :created, location: @grade_point_average }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @grade_point_average.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /grade_point_averages/1 or /grade_point_averages/1.json
  def update
    respond_to do |format|
      if @grade_point_average.update(grade_point_average_params)
        format.html { redirect_to @grade_point_average, notice: "Grade point average was successfully updated." }
        format.json { render :show, status: :ok, location: @grade_point_average }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @grade_point_average.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /grade_point_averages/1 or /grade_point_averages/1.json
  def destroy
    @grade_point_average.destroy!

    respond_to do |format|
      format.html { redirect_to grade_point_averages_path, status: :see_other, notice: "Grade point average was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_grade_point_average
      @grade_point_average = GradePointAverage.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def grade_point_average_params
      params.expect(grade_point_average: [ :exam, :cch, :final_average ])
    end
end
