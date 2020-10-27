class Dish < ActiveRecord::Base

    has_many :dishtags
    has_many :tags, through: :dishtags
    belongs_to :restaurant

end