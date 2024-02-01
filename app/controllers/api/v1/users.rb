module Api
  module V1
    class Users < Grape::API
      resource 'users' do
        helpers Api::V1::Helpers
        # helpers Api::V1::Helpers::Articles
        helpers SessionsHelper

        desc 'return all users'
        get do
          users = User.all
          present users , with: Api::V1::Entities::UserEntity
        end

        desc 'get user'
        get ':id' do
          user = User.find_by(id:   params[:id])
          present user , with: Api::V1::Entities::UserEntity
        end

        desc "add new user"
        params do
          requires :username, type: String
          requires :email, type: String
          requires :password, type: String
        end
        post "/new" do
          new_user = create_new_user(permitted_params[:username], permitted_params[:email],permitted_params[:password])
        end

        desc "update existing user"
        params do
          optional :username, type: String
          optional :email, type: String
          optional :password, type: String
        end
        patch ":id/edit" do
          updated_user = update_user(params[:id] , permitted_params[:username], permitted_params[:email], permitted_params[:password])
        end

        desc "delete a user"
        delete ":id/delete" do
          # if logged_in? && article_to_be_deleted.user_id == current_user
            delete_user(params[:id])
          # end
        end
      end
    end
  end
end
