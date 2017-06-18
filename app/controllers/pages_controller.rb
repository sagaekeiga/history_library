class PagesController < ApplicationController
  def index
      @chapters = Chapter.all
      @chapter = Chapter.new
      @section = Section.new
      @sections = Section.all
      @card = Card.new
      @cards = Card.all
  end
  
  def manage
      @chapters = Chapter.all
      @chapter = Chapter.new
      @section = Section.new
      @sections = Section.all
      @card = Card.new
      @cards = Card.all
  end
end
