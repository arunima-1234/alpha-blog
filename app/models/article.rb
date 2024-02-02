class Article < ApplicationRecord

  validates :article_title, presence: true, length: {minimum: 5, maximum:250}
  validates :article_description, presence: true, length: {minimum: 10, maximum:1000}

  belongs_to :user
  after_create :send_notification_mail

  def send_notification_mail
    SendNewArticleEmailJob.perform_async(id)
    # .deliver_now(id)
  end
end
