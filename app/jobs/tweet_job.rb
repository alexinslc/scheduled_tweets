class TweetJob < ApplicationJob
  queue_as :default

  def perform(tweet)
    return if tweet.published?

    # Rescheduled a tweet to the future
    return if tweet.publish_at > Time.current

    tweet.publish_to_twitter!
  end
end

# Push the publish_at backward in time
# Noon -> 8am
# - 
# 8am -> should publish and sets tweet id (because we change the time to sooner)
# Noon -> it's already published, does nothing

# Push the publish_at forward in time
# 9am -> 1pm
# - 
# 9am -> should do nothing (because we changed the time to later)
# 1pm -> should publish the tweet and set the tweet id