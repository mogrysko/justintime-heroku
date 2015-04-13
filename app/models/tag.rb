class Tag < ActiveRecord::Base
  has_many :taggings
  has_many :terms, dependent: :destroy, through: :taggings
end
