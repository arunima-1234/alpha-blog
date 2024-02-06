require 'rails_helper'

describe Article, type: :model do
  it 'return all the articles' do
    articles =Article.all
  end

  it 'return specific article' do
    article = Article.find_by(id: 8)
  end

  it 'create new user' do
    new_article = Article.create!(article_title: "specs testing", article_description: "desc for testing article specs", user_id: 8)
  end

  it 'destroy the article' do
    Article.create!(article_title: "specs testing", article_description: "desc for testing article specs", user_id: 8).destroy!
  end
end
