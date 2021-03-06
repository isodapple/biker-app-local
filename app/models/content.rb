class Content < ApplicationRecord
  has_many :comments

  validates :title, presence: true, length: {maximum: 30}
  validates :body, length: {maximum: 2000}

  def self.get_adress(results)
    address = results.first.address
    address_split = address.split(",").reverse
    address_split.delete_at(0)
    return address = "〒" + address_split.join(" ")
  end

  def self.get_prefecture(results)
    @prefecture = results.first.state
    content[:prefecture] = @prefecture
  end

  mount_uploader :image, ImageUploader

  # 検索機能
  def self.search(search)
    if search
      where(['place LIKE ?', "%#{search}%"]) 
    else
      all
    end
   end

  #  Mypageでの自分の作成物のみを取得
   def self.search_my_content(search)
      if search
            where(['name LIKE ?', "%#{search}%"]) 
        else
            all
        end
    end
    
end
