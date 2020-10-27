class Restaurant < ActiveRecord::Base 

    has_many :dishes

    def self.mcdonalds
        Restaurant.find_by_name("McDonalds")
    end

    def self.tenth
        Restaurant.all[9]
    end

    def self.with_long_names
        Restaurant.all.select do |r|
            r.name.length > 12
        end
    end

    def self.max_dishes
        Restaurant.all.max_by {|r| r.dishes.size}
    end

    def self.focused
        Restaurant.all.select do |r|
            r.dishes.length < 5
        end
    end

    def self.large_menu
        Restaurant.all.select do |r|
            r.dishes.length > 20
        end
    end

    def all_dishtags
        self.dishes.map do |d|
            d.tags
        end
    end

    # def self.vegetarian
    #     Restaurant.all.select do |r|
    #         r.all_dishtags.each do |d|
    #             d.each do |t|
    #                 t.name = "Vegetarian"
    #             end
    #         end
    #     end
    # end

    def self.vegetarian
        Restaurant.all.select do |r|
            r.all_dishtags
        end
    end

end