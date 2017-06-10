class EventsController < ApplicationController
    def create
     @event = Event.new(event_params)
     if @event.save
       redirect_to pages_manage_path
     else
       @events= Event.all
       render 'pages/manage'
     end
    end
    
    def destroy
      @event = Event.find(params[:id])
        if @event.delete
         flash[:success] = "deleted"
        end
        redirect_to pages_manage_path
    end
    
    def show
      @event = Event.find(params[:id])
    end
    
    def edit
      @characters = Character.all
      @character = Character.find(params[:id])
      @eras = Era.all
      @era = Era.new
      @event = Event.find(params[:id])
      @events= Event.all
    end
    
    def update
        @event = Event.find(params[:id])
        @event.update(event_params)
        redirect_to pages_manage_path
    end

    

    
      private
      
        def event_params
          params.require(:event).permit(:name, :season, :url, :description, :era, :character)
        end
end
