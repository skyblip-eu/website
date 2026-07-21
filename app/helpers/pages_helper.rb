module PagesHelper
  def link_to_page(slug, html_options = {})
    page = Page.find_by(base_slug: slug) || Page.find_by(base_slug: slug, locale: I18n.default_locale)
    raise Decant::FileNotFound, "Couldn't find Page with 'base_slug'=#{slug} and 'locale'=#{I18n.locale}" unless page

    lang = page.locale unless page.locale == I18n.locale
    link_to page.title, page_url_for(page, only_path: true), { lang: }.merge(html_options)
  end

  def pages_image_tag(path, options = {})
    image_tag "pages/#{@page.base_slug}/#{path}", options
  end
end
