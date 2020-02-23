class Content < ApplicationRecord

    def address
        [street, city, state, country].compact.join(', ')
    end

    #lat, lonというカラムを設ける
    geocoded_by :address, latitude: :lat, longitude: :lon

    mount_uploader :image, ImageUploader
    # mount_uploader :image, CloudinaryImageUploader

    def self.search(search)
      if search
        where(['place LIKE ?', "%#{search}%"]) 
      else
        all
      end
    end
    
end
