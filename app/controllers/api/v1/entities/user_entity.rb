module Api
  module V1
    module Entities
      class UserEntity < Api::V1::Entities::Base
        expose :username
        expose :email
        # expose::user_id => user.id,
      end
    end
  end
end
