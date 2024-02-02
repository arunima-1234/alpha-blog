class NewArticleMailer < ApplicationMailer

  def post_email
    @user = User.find_by(id: Article.last.user_id)
    emails = User.where.not(email: @user.email).pluck(:email).join(",")
    id = Article.last.id
    @url  = "http://localhost:3000/api/v1/articles/#{id}"
    bootstrap_mail(:to => emails, subject: "new article posted")
  end
end
