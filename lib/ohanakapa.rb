#require 'netrc'
require 'ohanakapa/configuration'
require 'ohanakapa/error'
require 'ohanakapa/client'

module Ohanakapa
	extend Configuration
		class << self

		# Alias for Ohanakapa::Client.new
		#
		# @return [Ohanakapa::Client]
		def new(options={})
			Ohanakapa::Client.new(options)
		end

		# Delegate to Ohanakapa::Client.new
	    def method_missing(method, *args, &block)
	      return super unless new.respond_to?(method)
	      new.send(method, *args, &block)
	    end

	    def respond_to?(method, include_private=false)
	      new.respond_to?(method, include_private) || super(method, include_private)
	    end

	end
end
