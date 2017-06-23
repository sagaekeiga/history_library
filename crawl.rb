require 'nokogiri'
require 'open-uri'
doc = Nokogiri::HTML(open("http://www.y-history.net/appendix/appendix-list.html"))
puts "リンク名"



##  第一部 ~単語を準備~
# リンク名・URLの取得
for num in 1..17 do
    puts num
    
    doc.css("#m_Menu_#{num}").each do |doc|
        @urls = doc.css('a')

        @urls.each do |url|
            # puts "URL"
            # puts num
            # # URLの取得
            # puts url[:href]
            # # リンク名の取得
            # puts "タイトル"
            # puts url.inner_text
        end
    end
    
end


##  第二部 ~各URL先の文章を取得~

puts "テスト"
@doc = Nokogiri::HTML(open("http://www.y-history.net/appendix/wh0101-000.html"))


doc.css('#m_Menu_1').each do |doc|
    @urls = doc.css('a')
    
    @urls.each do |url|
        puts "URL"

        begin
            @doc = Nokogiri::HTML(open("http://www.y-history.net/appendix/#{url[:href]}"))
            puts url[:href].delete(".html")
            puts @url = "#{url[:href].delete(".html")}"
            puts @url = @url.delete("w")
            
            # 文章を取得
            @doc.css("#wh#{@url} > div").each do |doc|
                    puts "URL先の文章"
                    puts @doc.css("#wh#{@url} > p").inner_text
                    puts doc.inner_text
                        # 画像取得
                        doc.css("img").each do |img|
                            @img = img[:src].gsub!(/\.\./, '')
                            puts "http://www.y-history.net/#{@img}"
                        end
            end
        rescue => e
            puts "失敗"
        end
    end
    
end