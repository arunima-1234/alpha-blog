class SendNewArticleEmailJob
  include Sidekiq::Job

  def perform(article_id)
    NewArticleMailer.post_email(article_id).deliver_now
  end
end
