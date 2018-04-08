require './lib/repository'

class User < ActiveRecord::Base
  include ActiveModel::Validations

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :omniauthable, omniauth_providers: [:google_oauth2]

  belongs_to :craftsman
  before_create :associate_craftsman

  def associate_craftsman
    craftsman = Craftsman.find_by_email(self.email)
    self.craftsman_id = craftsman.employment_id if craftsman
  end

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data['email']).first
    user
  end
  private

  def self.find_or_create_by_auth_hash(hash)
    if user = User.find_by_uid(hash['uid'])
      return user
    end

    user = User.new
    user.email = user.login = hash['info']['email']
    user.uid = hash['uid']
    user.provider = hash['provider']
    user.save!
    user
  end
end
