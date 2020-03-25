class Gratitude < ApplicationRecord
    
  belongs_to :user
  has_many :comments
  has_many :users, through: :comments
  # validates :content, presence: true



end
