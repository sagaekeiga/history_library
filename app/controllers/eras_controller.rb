class ErasController < ApplicationController
    def create
     @era = Era.new(era_params)
     if @era.save
       redirect_to pages_manage_path
     else
       @eras= Era.all
       render 'pages/manage'
     end
    end
    
    def destroy
      @era = Era.find(params[:id])
        if @era.delete
         flash[:success] = "deleted"
        end
        redirect_to pages_manage_path
    end
    
    def show
      @era = Era.find(params[:id])
    end
    
    def edit
      @characters = Character.all
      @character = Character.new
      @eras = Era.all
      @era = Era.find(params[:id])
      @event = Event.new
      @events= Event.all
    end
    
    def update
        @era = Era.find(params[:id])
        @era.update(era_params)
        redirect_to pages_manage_path
    end

    

    
      private
      
        def era_params
          params.require(:era).permit(:name, :start, :closed, :description)
        end
end
