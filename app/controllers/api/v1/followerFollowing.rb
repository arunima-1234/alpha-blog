module Api
  module V1
    class FollowerFollowing < Grape::API
      resource 'users' do
        helpers Api::V1::Helpers

        desc 'return all followers of a user'
        get ':id/followers' do
          all_followers = UserFollower.where(followed_id: params[:id])
          present all_followers, with: Api::V1::Entities::FollowerEntity
        end

        desc 'follow a user'
        params do
          requires :follow_user, type:Integer
        end
        post ':id/follow' do
          UserFollower.create!(follower_id: params[:id], followed_id: permitted_params[:follow_user])
        end

      end
    end
  end
end
