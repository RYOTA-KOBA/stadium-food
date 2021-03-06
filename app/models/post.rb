class Post < ApplicationRecord
    belongs_to :user

    has_many :comments, dependent: :delete_all 

    validates :body, presence: true
        
    attachment :image

    mount_uploader :image, ImageUploader
end
