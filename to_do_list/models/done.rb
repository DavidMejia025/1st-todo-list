class Done < ActiveRecord::Base
  belongs_to :activity
  belongs_to :to_do

end