module Api
  class Base < Grape::API
    format :json
    prefix :api
    version_type = 'v1'
    version version_type, using: :path

    mount Api::V1::Base
  end
end
