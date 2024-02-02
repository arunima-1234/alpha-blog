module Api
  module V1
    module Helpers
      extend Grape::API::Helpers
      include SessionsHelper

      def permitted_params
        @permitted_params ||= declared(params, include_missing: false)
      end

      def update_article(article_id, updated_title, updated_desc)
        article_to_be_updated = Article.find_by(id: article_id)
        article_to_be_updated.update!(article_title: updated_title, article_description: updated_desc)
      end

      def create_new_article(title, desc, user_id)
        @new_article = Article.create!(article_title: title, article_description: desc, user_id: user_id)
        @new_article
      end

      def delete_article(article_id)
        article_to_be_deleted = Article.find_by(id: article_id)
        article_to_be_deleted.destroy!
      end

      def update_user(user_id, updated_username, updated_email, updated_password)
        user_to_be_updated = User.find_by(id: user_id)
        updated_username = updated_username.presence || user_to_be_updated.username
        updated_email = updated_email.presence || user_to_be_updated.email
        updated_password = updated_password.presence || user_to_be_updated.password

        user_to_be_updated.update!(username: updated_username, email: updated_email, password: updated_password)
      end

      def create_new_user(username, email, password)
        User.create!(username: username, email: email, password: password)
      end

      def delete_user(user_id)
        user_to_be_deleted = User.find_by(id: user_id)
        user_to_be_deleted.destroy!
      end

    end
  end
end
