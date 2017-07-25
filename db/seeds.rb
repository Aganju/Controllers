# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#

ArtworkShare.delete(ArtworkShare.all)
Artwork.delete(Artwork.all)
User.delete(User.all)
10.times do
  User.create(user_name: Faker::Name.last_name)
end

User.all.each do |user|
  5.times do
    art_name = Faker::Movie.quote
    url = user.user_name + '/' + art_name + '.com'
    Artwork.create(title: art_name, image_url: url, artist_id: user.id)
  end
end

Artwork.all.each do |art|
  7.times do
    viewer_id = User.all.sample.id
    ArtworkShare.create(artwork_id: art.id, viewer_id: viewer_id) if art.artist_id != viewer_id
  end
end
