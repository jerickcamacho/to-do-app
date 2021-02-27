class Category < ApplicationRecord
    has_many :lists
    belongs_to :user, optional: true
end
