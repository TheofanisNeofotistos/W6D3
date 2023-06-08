# == Schema Information
#
# Table name: artworks
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  image_url  :string           not null
#  artist_id  :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Artwork < ApplicationRecord
    validates :title, :image_url, presence: true 
    # validates [:artist_id, :title], uniqueness: true
    validates :artist_id, uniqueness: { scope: :title }

    belongs_to :artist,
    primary_key: :id,
    foreign_key: :artist_id,
    class_name: :User

    has_many :artwork_shares,
    primary_key: :id,
    foreign_key: :artwork_id,
    class_name: :ArtworkShare,
    dependent: :destroy,
    inverse_of: :artwork

    has_many :shared_viewers,
    through: :artwork_shares,
    source: :viewer

    has_many :comments,
    primary_key: :id,
    foreign_key: :artwork_id,
    class_name: :Comment,
    dependent: :destroy,
    inverse_of: :artwork
    
    #acts as an active record query 
    def self.artworks_for_user_id(id)
        Artwork.left_joins(:shared_viewers).where("artworks.artist_id = #{id} OR artwork_shares.viewer_id = #{id}")
    end 
    
end 
