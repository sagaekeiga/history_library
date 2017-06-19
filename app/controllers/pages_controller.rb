class PagesController < ApplicationController
    http_basic_authenticate_with name: "sagae", password: "s19930528"
  def index
      @chapters = Chapter.all
      @chapter = Chapter.new
      @section = Section.new
      @sections = Section.all
      @card = Card.new
      @cards = Card.all
  end
  
  def manage
      @q        = Card.search(params[:q])
      @chapters = Chapter.all
      @chapter = Chapter.new
      @section = Section.new
      @sections = Section.all
      @card = Card.new
      @cards = Card.all
  end
end
