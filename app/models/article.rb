class Article < ApplicationRecord

  validates :article_title, presence: true, length: {minimum: 5, maximum:250}
  validates :article_description, presence: true, length: {minimum: 10, maximum:1000}

  belongs_to :user
  after_create :send_notification_mail

  def send_notification_mail
    NewArticleMailer.post_email.deliver_now
    { status: :created, message: 'Article was successfully created. An email has been sent', article: @new_article }
  end


end
