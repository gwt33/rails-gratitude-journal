class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  #scope method requirement
  scope :ordered_by_title, -> { order(title: :asc) }
  scope :ordered_by_time, -> { order(created_at: :desc) }
  
end
