class User < ActiveRecord::Base 
#user.url = auth_hash['info']['urls'][user.provider.capitalize]
class << self
  def from_omniauth(auth_hash)
    user = find_or_create_by(uid: auth_hash['uid'], provider: auth_hash['provider'])
    user.name = auth_hash['info']['name']
    user.location = auth_hash['info']['location']
    user.image_url = auth_hash['info']['image']
    if !auth_hash['info']['urls'].nil? 
        user.url = auth_hash['info']['urls']['Google']
    end    
    user.save!
    user
  end
end
end
