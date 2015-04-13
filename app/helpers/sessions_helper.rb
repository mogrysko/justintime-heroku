module SessionsHelper
  def current_course
    @current_course ||= Course.find_by(id: session[:course_id])
  end
  def current_course?(course)
    course == current_course
  end
  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = column == sort_column ? "current #{sort_direction}" : nil
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to title, {:sort => column, :direction => direction}, {:class => css_class}
  end
end
