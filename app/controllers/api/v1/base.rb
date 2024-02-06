module Api
  module V1
    class Base < Grape::API

      mount Api::V1::Articles
      mount Api::V1::Users
      mount Api::V1::FollowerFollowing
    end
  end
end
