class SessionController <ApplicationController
  def show
    @courses = Course.all
  end
  def create
    session[:course_id] = params[:id]
    redirect_to course_path(course)
  end
end
