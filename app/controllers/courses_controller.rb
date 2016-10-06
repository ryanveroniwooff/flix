class CoursesController < ApplicationController
  def index
    @courses = Course.all
  end

  def show
    @course = Course.find_by_id(params[:course_id])
  end
    def image
    @image = image
  end
  private
    helper_method :current_course
  def current_course
    @current_course ||= Course.find(params[:id])
  end
end
