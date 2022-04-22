class TwitterAccount < ApplicationRecord
  belongs_to :user
  # twitter_account cannot be deleted unless we delete all the tweets
  # this "dependent: :destroy" will delete all the tweets associated with the twitter account
  # when it is requested to be deleted 
  has_many :tweets, dependent: :destroy

  validates :username, uniqueness: true

  def client
    Twitter::REST::Client.new do |config|
      config.consumer_key        = Rails.application.credentials.dig(:twitter, :api_key)
      config.consumer_secret     = Rails.application.credentials.dig(:twitter, :api_secret)
      config.access_token        = token
      config.access_token_secret = secret
    end
  end 
end
