class Project < ActiveRecord::Base
  belongs_to :event
  validates :title, presence: true
  validates :description, presence: true, length: { minimum: 10 }
end
