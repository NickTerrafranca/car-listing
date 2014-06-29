class Car < ActiveRecord::Base
  belongs_to :manufacturer

  validates :year, presence: true, numericality: { greater_than: 1920, less_than: 2015 }
  validates :model, presence: true
  validates :mileage, presence: true
  validates :color, presence: true
  validates :manufacturer, presence: true
end
