class Term < ActiveRecord::Base
  has_many :termlists
  has_many :courses, dependent: :destroy, through: :termlists
  has_many :taggings
  has_many :tags, dependent: :destroy, through: :taggings
  validates_presence_of :termname, :definition
  def all_courses=(names)
    self.courses = names.split(",").map do |name|
      Course.where(coursename: name.strip).first_or_create!
    end
  end

  def all_courses
    self.courses.map(&:coursename).join(", ")
  end

  def self.tagged_by_course(coursename)
    Course.find_by_coursename!(coursename).terms
  end

  def self.tagged_with(tagname)
    Tag.find_by_tagname!(tagname).terms
  end

  def all_tags=(names)
    self.tags = names.split(",").map do |name|
      Tag.where(tagname: name.strip).first_or_create!
    end
  end

  def all_tags
    self.tags.map(&:tagname).join(", ")
  end

  def self.search(query)
    where("termname ilike ?", "%#{query}%")
  end
end
