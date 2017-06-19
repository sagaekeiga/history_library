class CardsController < ApplicationController
    http_basic_authenticate_with name: "sagae", password: "s19930528"
    
    def index
      @q        = Card.search(params[:q])
      @cards = @q.result(distinct: true)
    end
    
    def new
        @q        = Card.search(params[:q])
        @card = Card.new
    end
    
    def create
     @card = Card.new(card_params)
     if @card.save
       redirect_to pages_manage_path
     else
       render 'cards/new'
     end
    end
    
    def edit
      @q        = Card.search(params[:q])
      @card = Card.find(params[:id])
    end
    
    def destroy
      @card = Card.find(params[:id])
        if @card.delete
         flash[:success] = "deleted"
        end
        redirect_to pages_manage_path
    end
    
    def show
      @q        = Card.search(params[:q])
      @card = Card.find(params[:id])
    end
    
    def update
        @card = Card.find(params[:id])
        @card.update(card_params)
        redirect_to pages_manage_path
    end

    

    
      private
      
        def card_params
          params.require(:card).permit(:kind, :name, :url, :description, :chapter, :section, :year)
        end
end
