class NewArticleMailer < ApplicationMailer

  def post_email(article_id)
    @article = Article.find_by(id: article_id)
    @user = User.find_by(id: @article.user_id)
    emails = User.where.not(email: @user.email).pluck(:email).join(",")
    @url  = "http://localhost:3000/api/v1/articles/#{article_id}"
    bootstrap_mail(:to => emails, subject: "new article posted")
  end
end
