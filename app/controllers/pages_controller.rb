class PagesController < ApplicationController
  def index
      @events = Event.all
      @characters = Character.all
      @arrays = []
      @arrays << @events
      @arrays << @characters
  end
  
  def manage
      @characters = Character.all
      @character = Character.new
      @era = Era.new
      @eras = Era.all
      @event = Event.new
      @events = Event.all
  end
end
