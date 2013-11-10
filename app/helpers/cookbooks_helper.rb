module CookbooksHelper
  def cookbook_thumbnail(cookbook)
    gbook = GoogleBooks.search("isbn:#{cookbook.isbn.gsub('-', '')}").first
    
    if gbook
      image_tag gbook.image_link
    else
      image_tag "no_cover.jpg" 
    end
  end

end
