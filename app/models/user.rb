class User < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :trackable, :omniauthable, omniauth_providers: %i(google)

  has_many :works
  mount_uploader :avatar, AvatarUploader

  protected
   def self.find_for_google(auth)
     user = User.find_by(email: auth.info.email)

     unless user
       user = User.create(username:     auth.info.username,
                          avatar: auth.avatar,
                          password: Devise.friendly_token[0, 20],
                          )
     end
     user
   end
end
