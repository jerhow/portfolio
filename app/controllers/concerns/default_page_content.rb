module DefaultPageContent
  extend ActiveSupport::Concern

  included do
    before_action :set_page_defaults
  end

  def set_page_defaults
    @page_title = "Technophobic Software || My Portfolio Website"
    @seo_keywords = "Jerry Howard portfolio foo bar baz quux"
  end
end
