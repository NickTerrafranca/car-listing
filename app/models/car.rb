class Car < ActiveRecord::Base
  belongs_to :manufacturer
  validates :year, numericality: { greater_than: 1919, less_than: 2015 }
  validates :year, presence: true
  validates :model, presence: true
  validates :mileage, presence: true
  validates :color, presence: true
  validates :manufacturer, presence: true
end
