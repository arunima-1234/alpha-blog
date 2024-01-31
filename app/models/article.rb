class Article < ApplicationRecord

  validates :article_title, presence: true, length: {minimum: 5, maximum:250}
  validates :article_description, presence: true, length: {minimum: 10, maximum:1000}

  belongs_to :user
end
