module Api
  module V1
    class Articles < Grape::API

      resource 'articles' do
        helpers Api::V1::Helpers
        helpers SessionsHelper

        desc 'return all articles'
        get do
          articles = Article.all
          present articles , with: Api::V1::Entities::ArticleEntity

        end

        desc 'get article'
        get ':id' do
          article = Article.find_by(id:   params[:id])
          present article , with: Api::V1::Entities::ArticleEntity
        end

        desc "add new article"
        params do
          requires :article_title, type: String
          requires :article_description, type: String
          requires :user_id, type: Integer
        end
        post "/new" do
          new_article = create_new_article(permitted_params[:article_title], permitted_params[:article_description], permitted_params[:user_id])

          if new_article[:status] == :created
            present new_article, with: Api::V1::Entities::ArticleEntity
            { message: new_article}
          else
            error!(new_article, 422)
          end

        end

        desc "update existing article"
        params do
          requires :article_title, type: String
          requires :article_description, type: String
        end
        patch ":id/edit" do
          updated_article = update_article(params[:id] , permitted_params[:article_title], permitted_params[:article_description])
        end

        desc "delete an article"
        delete ":id/delete" do
          # if logged_in? && article_to_be_deleted.user_id == current_user
            delete_article(params[:id])
          # end
        end
      end
    end
  end
end
