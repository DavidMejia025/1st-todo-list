class Activity < ActiveRecord::Base
  belongs_to :category
  belongs_to :calendar
  belongs_to :to_do
  has_many :dones

  def done (count)
    count + 1
  end
end