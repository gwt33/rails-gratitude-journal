class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :gratitude

    validates :content, presence: true
end
