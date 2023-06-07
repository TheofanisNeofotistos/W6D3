class Artwork < ApplicationRecord
    validates :title, presence: true 
    # validates [:artist_id, :title], uniqueness: true
    validates :artist_id, uniqueness: { scope: :title }
end 