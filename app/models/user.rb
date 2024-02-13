class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :comments, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         has_many :spots, dependent: :destroy
         has_many :likes, dependent: :destroy
         has_many :liked_spots, through: :likes, source: :spot
         has_many :spots, dependent: :destroy 
         validates :name, presence: true 
         validates :profile, length: { maximum: 200 }
         def already_liked?(spot)
          self.likes.exists?(spot_id: spot.id)
        end
        end
