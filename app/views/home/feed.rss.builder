#encoding: UTF-8

xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "Your Blog Name Goes Here"
    xml.author "Your Name Here"
    xml.description "Some Info To Describe, Can be comman separated, Ruby, Rails"
    xml.link "http://yourdomain.here"
    xml.language "en"

    for article in @posts_rss
      xml.item do
        if article.title
          xml.title article.title
        else
          xml.title ""
        end
        xml.author "Your Name Here"
        xml.pubDate article.created_at.to_s(:rfc822)
        xml.link "http://yourdomain.io/" + article.slug
        xml.guid article.id

        text = article.title
        xml.description "<p>" + text + "</p>"
      end
    end
  end
end
