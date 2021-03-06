class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  has_many :sent_bouquets, class_name: :Bouquet, foreign_key: :sender_id
  has_many :received_bouquets, class_name: :Bouquet, foreign_key: :receiver_id

  devise :database_authenticatable, :trackable, :validatable,
        :omniauthable, :omniauth_providers => [:spotify]


  def self.from_omniauth(auth)
    user = where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.email = auth.info.email
        user.password = Devise.friendly_token[0,20]
        user.username = auth.info.nickname
      if auth.info.birthdate
        user.birthdate = auth.info.birthdate
      end

      if auth.info.image
        user.picture_url = auth.info.image
      end
    end

    # whyyy
    user.token = auth.credentials.token
    user.refresh_token = auth.credentials.refresh_token
    # expiration in seconds
    user.expiration = auth.credentials.expires_at

    return user
  end

  def token_expired?
    if (self.expiration - Time.now.to_i) > 0
      return false
    else
      return true
    end
  end

end
