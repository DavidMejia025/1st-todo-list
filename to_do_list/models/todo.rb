class ToDo < ActiveRecord::Base
  has_many :activities
  has_many :dones
  has_many :categories
end