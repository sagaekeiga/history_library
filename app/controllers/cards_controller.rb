class CardsController < ApplicationController
    
    def new
        @card = Card.new
    end
    
    def create
     @card = Card.new(card_params)
     if @card.save
       redirect_to pages_manage_path
     else
       @cards = Card.all
       render 'pages/manage'
     end
    end
    
    def edit
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
      @card = Card.find(params[:id])
    end
    
    def edit
      @characters = Character.all
      @character = Character.find(params[:id])
      @eras = Era.all
      @era = Era.new
      @event = Event.find(params[:id])
      @events= Event.all
      @other = Other.new
      @others = Other.all
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
