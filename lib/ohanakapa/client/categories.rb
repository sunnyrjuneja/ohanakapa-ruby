module Ohanakapa
  class Client

    # Methods for the Categories endpoint
    #
    # @see http://ohanapi.herokuapp.com/api/docs
    module Categories

      # List all categories
      #
      # This provides a dump of every category, in the order that they
      # were uploaded to the Ohana DB.
      #
      # @see http://ohanapi.herokuapp.com/api/docs#!/api/GET-api-categories---format-_get_0
      #
      # @return [Array<Sawyer::Resource>] List of Categories.
      #
      # @example
      #   Ohanakapa.categories
      # @example
      #   Ohanakapa.cats
      def categories(options={})
        paginate "categories", options
      end
      alias :cats :categories

      # Replace all categories for a Service
      #
      # @param service_id [String] Number ID of the service
      # @param cat_ids [Array] An array of category IDs to use as replacement
      # @return [<Sawyer::Resource>] The updated service
      # @see http://ohanapi.herokuapp.com/api/docs
      # @example Replace categories for service with ID '521d339f1974fcdb2b00573e'
      #   Ohanakapa.replace_all_categories("521d339f1974fcdb2b00573e", ['52280f5c1edd37edff000001', '52280f5c1edd37edff000003'])
      def replace_all_categories(service_id, cat_ids)
        put "services/#{service_id}/categories", :query => { :category_ids => cat_ids }
      end


    end
  end
end
