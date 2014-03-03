class User < ActiveRecord::Base
  belongs_to :profile
  def self.from_omniauth(auth)
    if auth.present?
      tmp_user=nil
      where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.name = auth.info.name
        user.oauth_token = auth.credentials.token
        user.oauth_expires_at = Time.at(auth.credentials.expires_at)
        if user.save!
          if user.profile.nil?
            user.profile = Profile.new
            user.save!
          end
        end
        tmp_user=user
      end
    end
    tmp_user
  end
end
