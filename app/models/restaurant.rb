class Restaurant < ApplicationRecord
    mount_uploader :image_path,ImageUploader
    
    validates        :res_name,
                     presence: true
                     
    searchable do
          text  :detail_addr, :res_name
    end
                 
    belongs_to       :state
    belongs_to       :district
    belongs_to       :road
    
    has_many         :menus
    has_many         :visiteds
    has_many         :users, through: :visiteds
    
    
    def self.search_restaurant(condition)
        unless condition.strip.empty?
            Restaurant.where("detail_addr LIKE ?","%#{condition}%")
        end
    end
    
end
