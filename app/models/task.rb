class Task < ApplicationRecord
  validates :name, presence: true, length: { maximum: 30 }
  validates :body, presence: true, length: { maximum: 100 } 
end
