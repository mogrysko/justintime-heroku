class TermsController < ApplicationController
  def index
    if params[:search]
      @terms = Term.search(params[:search])
    elsif params[:tag]
      @terms = Term.tagged_with(params[:tag]).order('termname ASC')
    else
      @terms = Term.all.order('termname ASC')
    end
  end
  def addterms
    @course = Course.find(session[:course_id])
    session[:coursename] = @course.coursename
    if params[:search]
      @terms = Term.search(params[:search])
    elsif params[:tag]
      @terms = Term.tagged_with(params[:tag]).order('termname ASC')
    else
      @terms = Term.all.order('termname ASC')
    end
  end
  def new
    @term = Term.new
  end
  def create
    @term = Term.create(term_params)
    if @term.save
      redirect_to terms_path
    else
        render 'new'
    end
  end
  def edit
    @term = Term.find(params[:id])
  end
  def update
    @term = Term.find(params[:id])
    @term.update(term_params)
    if @term.save
      redirect_to terms_path
    else
        render 'edit'
    end
  end
  def destroy
    term = Term.find(params[:id])
    term.destroy
    redirect_to terms_path
  end
  def add
    term = Term.find(params[:id])
    term.termlists.create!(course_id: current_course.id)
    redirect_to '/add'
  end
  def remove
    term = Term.find(params[:id])
    term.termlists.where(course_id: current_course.id).delete_all
    redirect_to '/add'
  end
  private
  def term_params
    params.require(:term).permit(:termname, :definition, :all_tags)
  end
  def has_not_added?(term)
    term.termlists.where(course_id: current_course.id).empty?
  end
  helper_method :has_not_added?
end
