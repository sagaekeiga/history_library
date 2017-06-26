module Api
  module V1
    class CardsController < ApplicationController
    skip_before_filter :verify_authenticity_token


      def index
         @cards = Card.all
         render json: @cards
      end
      
      
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
         @card = Card.find_by(name: params) if !params.nil?
         render json: @card
      end
        
    end
  end
end