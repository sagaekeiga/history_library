module Api
  module V1
    class CardsController < ApplicationController
    skip_before_filter :verify_authenticity_token
      
      def search
         params = request.body.read
         logger.debug("params")
         logger.debug(params)
         logger.debug("params")
         @card = Card.where("name like '%#{params}%'")
         render json: @card
      end
        
    end
  end
end