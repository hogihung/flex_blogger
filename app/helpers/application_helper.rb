module ApplicationHelper

  def clean_html(text)
    doc = Nokogiri::HTML(text)
    doc.text
  end

end
