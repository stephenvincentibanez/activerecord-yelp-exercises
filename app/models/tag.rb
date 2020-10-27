class Tag < ActiveRecord::Base

    has_many :dishtags
    has_many :dishes, through: :dishtags

end