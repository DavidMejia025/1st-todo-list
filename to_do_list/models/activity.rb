class Activity < ActiveRecord::Base
  belongs_to :category
  belongs_to :calendar
  belongs_to :todo
end