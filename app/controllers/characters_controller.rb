class CharactersController < ApplicationController
    def create
     @character = Character.new(character_params)
     if @character.save
       redirect_to pages_manage_path
     else
       @characters = Character.all
       render 'pages/manage'
     end
    end
    
    def destroy
      @character = Character.find(params[:id])
        if @character.delete
         flash[:success] = "deleted"
        end
        redirect_to pages_manage_path
    end
    
    def show
      @character = Character.find(params[:id])
    end
    
    def edit
      @characters = Character.all
      @character = Character.find(params[:id])
      @eras = Era.all
      @era = Era.new
      @event = Event.new
      @events= Event.all
    end
    
    def update
        @character = Character.find(params[:id])
        @character.update(character_params)
        redirect_to pages_manage_path
    end

    

    
      private
      
        def character_params
          params.require(:character).permit(:name, :event, :description, :life, :url, :era)
        end
end
