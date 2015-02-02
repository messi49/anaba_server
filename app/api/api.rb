require 'api_v1.rb'
require 'api_v2.rb'
require 'api_v3.rb'

module API
	  class Base < Grape::API
		      #mount API::V1
		      mount API::V2
		      mount API::V3
		        end
end
