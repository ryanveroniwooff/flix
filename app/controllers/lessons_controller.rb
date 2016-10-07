class LessonsController < ApplicationController
  before_action :authenticate_user!
  def show
    @lesson = current_lesson.section.course(@course)
    if !current_lesson.section.course.user.enrolled_in?(course_url)
      redirect_to current_lesson
    else
      redirect_to course_path(course_url), alert: 'You must be enrolled in this course!'
    end
  end

  private
    helper_method :current_lesson
  def current_lesson
    @current_lesson ||= Lesson.find(params[:id])
  end
end
