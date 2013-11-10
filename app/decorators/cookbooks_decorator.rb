class CookbooksDecorator < Draper::Decorator
  delegate_all

  class NoGoogleBook
    def image_link
      "no_cover.jpg"
    end

    def description
      nil
    end
  end

  def initialize(*args)
    super(*args)
    @gbook = GoogleBooks.search("isbn:#{isbn.try(:gsub, '-', '')}").first || NoGoogleBook.new
  end

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end

  def thumbnail()
      h.image_tag @gbook.image_link
  end

  def description()
    @gbook.description || "Keine Beschreibung verfügbar"
  end
end
