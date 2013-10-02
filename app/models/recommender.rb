class Recommender
  MINIMUM_FEEDBACK = 3

  def self.enough_rated_articles?(channel)
    channel.rated_articles_count >= MINIMUM_FEEDBACK
  end

  def self.rank_closeness(channel_id)
    channel = Channel.find(channel_id)
    closeness = {}
    if enough_rated_articles?(channel)
      channel.unrated_articles.each do |article|
        closeness[article.id] = article.compute_closeness
      end
    end
    closeness
  end

  def self.best_articles_ranked(channel_id)
    closeness = rank_closeness(channel_id)
    sorted = closeness.sort_by{|k,v| v}.reverse
    Hash[sorted].keys
  end

end