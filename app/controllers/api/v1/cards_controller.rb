module Api
  module V1
    class CardsController < ApplicationController
    skip_before_filter :verify_authenticity_token
      
      def search
         params = request.body.read
         logger.debug("params")
         logger.debug(params)
         logger.debug("params")
         @cards = Card.where("name like '%#{params}%'") if !params.nil?
         render json: @cards
      end
      
      def detail
         params = request.body.read
         logger.debug("params")
         logger.debug(params)
         logger.debug("params")
         @card = Card.where("id like '%#{params.to_i}%'") if !params.nil?
         render json: @card
      end
        
    end
  end
end