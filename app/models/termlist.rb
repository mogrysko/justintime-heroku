class Termlist < ActiveRecord::Base
  belongs_to :course
  belongs_to :term
end
