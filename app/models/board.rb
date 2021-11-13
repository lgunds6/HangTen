class Board < ApplicationRecord
    validates :title, presence: true
    validates :condition, presence: true
    validates :description, presence: true, length: {minimum: 10}
    validates :price, presence: true
    belongs_to :user
    
end
