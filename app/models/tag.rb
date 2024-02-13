class Tag < ApplicationRecord
    has_many :spot_tags, dependent: :destroy
    has_many :spots, through: :spot_tags   
  end
