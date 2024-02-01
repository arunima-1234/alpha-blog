module Api
  module V1
    module Entities
      class Base < Grape::Entity
        format_with(:timestamp) { |datetime| datetime&.utc&.iso8601 }
      end
    end
  end
end

