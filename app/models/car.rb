class Car < ActiveRecord::Base
  belongs_to :manufacturer

  validates :year, presence: true, numericality: {
    greater_than: 1919, less_than: 2015
    }
  validates :model, presence: true
  validates :mileage, presence: true, numericality: { greater_than: 0 }
  validates :color, presence: true
  validates :manufacturer, presence: true
end
