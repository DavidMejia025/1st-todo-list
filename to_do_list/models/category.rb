class Category < ActiveRecord::Base
  has_many :activities
  belongs_to :to_do
end
