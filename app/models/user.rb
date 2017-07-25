class User < ActiveRecord::Base
   validates :user_name, presence: true, uniqueness: true

   has_many :artworks,
    dependent: :destroy,
    primary_key: :id,
    foreign_key: :artist_id,
    class_name: :Artwork

     has_many :art_shares,
      dependent: :destroy,
      primary_key: :id,
      foreign_key: :viewer_id,
      class_name: :ArtworkShare

     has_many :shared_artworks,
       through: :art_shares,
       source: :artwork

end
