
module Ohanakapa
  class Client
    module Query

      #TODO move pagination to a superclass or mixin
      #include Ohanakapa::Pagination

      # Performs a query of the API
      # @param params [Object] parameter object.
      # @return [Hashie::Mash] Hash representing a organization's details.
      def query(params)
        params.delete_if { |k, v|
          v.nil? || v.empty? 
        }

        query = get("search?=",params)
        pagination = query[:pagination]
        @pagination = Ohanakapa::Pagination.new( pagination[:current], pagination[:per_page] , pagination[:count] )
        Ohanakapa::Response.new(query.response,@pagination)
      end
    
    end
  end
end
