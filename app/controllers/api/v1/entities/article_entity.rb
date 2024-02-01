module Api
  module V1
    module Entities
      class ArticleEntity < Api::V1::Entities::Base
        expose :article_title
        expose :article_description
        # expose::user_id => user.id,
      end
    end
  end
end
