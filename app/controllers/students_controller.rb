class StudentsController < ApplicationController
  before_action :set_student, only: :show
  
  def index
    @students = Student.all
  end

  def show
    @student = Student.find(params[:id])
  end

  def activate
    # this updates the model to be the opposite 'active' boolean
    @student = Student.find(params[:id])
    if !@student.active
      @student.update(active: true)
    elsif @student.active
        @student.update(active: false)
    end
    redirect_to student_path(@student)
  end

  private

    def set_student
      @student = Student.find(params[:id])
    end
end