class CardsController < ApplicationController
    http_basic_authenticate_with name: "sagae", password: "s19930528"
    
    require 'nokogiri'
    require 'open-uri'
    
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
       redirect_to root_path
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
        redirect_to root_path
    end
    
    def show
      @q        = Card.search(params[:q])
      @card = Card.find(params[:id])
    end
    
    def update
        @card = Card.find(params[:id])
        @card.update(card_params)
        redirect_to root_path
    end
    
    
    def title
      doc = Nokogiri::HTML(open("http://www.y-history.net/appendix/appendix-list.html"))
      for num in 0..9 do
          puts num
          
          doc.css("#m_Menu_#{num}").each do |doc|
              @urls = doc.css('a')
              
              @urls.each do |url|
                  begin
                    @card = Card.new
                    puts "URL"
                    puts num
                    # URLの取得
                    puts url[:href]
                    @card[:url] = url[:href]
                    # リンク名の取得
                    puts "タイトル"
                    puts url.inner_text
                    @card[:name] = url.inner_text
                    @card.description = ""
                    @card.save!
                  rescue => e
                    puts "エラー"
                  end
              end
          end
          
      end
      
      for num in 10..17 do
          puts num
          
          doc.css("#m_Menu_#{num}").each do |doc|
              @urls = doc.css('a')
              
              @urls.each do |url|
                  begin
                    @card = Card.new
                    puts "URL"
                    puts num
                    # URLの取得
                    puts url[:href]
                    @card[:url] = url[:href]
                    # リンク名の取得
                    puts "タイトル"
                    puts url.inner_text
                    @card[:name] = url.inner_text
                    @card.description = ""
                    @card.save!
                  rescue => e
                    puts "エラー"
                  end
              end
          end
          
      end
      redirect_to root_path
    end
    
    
    def sentence
          @urls = Card.all
          @n = 0
          
          @urls.each do |url|
              puts "URL"
              begin
                  @doc = Nokogiri::HTML(open("http://www.y-history.net/appendix/#{url.url}"))
                  url.url.delete(".html")
                  @url = "#{url.url.delete(".html")}"
                  @url = @url.delete("w")
                
                  # 文章を取得
                  @doc.css("#wh#{@url} > div").each do |doc|
                          @card = Card.find_by(url: url.url)
                            if @card.description == ""
                              puts @card.id
                              
                              
                              puts "エピソード"
                              puts @episode = @doc.css("#wh#{@url} > div.note-style > p.epi-waku").inner_text
                              # エピソードのインデックス
                              @index_doc = doc.inner_text.index("#{@episode}") - 1
                              puts @remove_episode = doc.inner_text.slice(0..@index_doc)
                              #先頭の説明
                              puts @lead = @doc.css(".lead").inner_text
                            
  
                              # 説明変数に抽出情報を格納
                              @card.description = @lead + @remove_episode
                              
                                  # 画像取得
                                  doc.css("img").each do |img|
                                      @img = img[:src].gsub!(/\.\./, '')
                                      puts "http://www.y-history.net/#{@img}"
                                      @card.image = "http://www.y-history.net/#{@img}"
                                  end
  
                              @card.save!
                            else
                              @n += 1
                            end
                            
                            if @n > 10
                              break
                            end
              
              end
              rescue => e
                  puts "失敗"
              end
              
              
          end
      redirect_to root_path
    end

    

    
      private
      
        def card_params
          params.require(:card).permit(:kind, :name, :url, :description, :chapter, :section, :year)
        end
end
