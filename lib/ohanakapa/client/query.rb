module Ohanakapa
  class Client
    module Query

      # Performs a query of the API
      # @param params [Object] parameter object.
      # @return [Hashie::Mash] Hash representing a organization's details.
      def query(params)
        params.delete_if { |k, v|
          v.nil? || v.empty? 
        }

        response = get("search?=",params)
      end

    end
  end
end
