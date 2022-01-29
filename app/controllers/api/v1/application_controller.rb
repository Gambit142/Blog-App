module Api
  module V1
    class ApplicationController < ActionController::API
      include ExceptionHandler

      def render_jsonapi_response(resource)
        if resource.errors.empty?
          render jsonapi: resource
        else
          render jsonapi_errors: resource.errors, status: 400
        end
      end
    end
  end
end
