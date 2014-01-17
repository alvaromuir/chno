class Event < ActiveRecord::Base
  validates :name, presence: true
  has_many :projects, dependent: :delete_all
end
