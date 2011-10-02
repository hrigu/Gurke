require File.dirname(__FILE__)+'/pages/base_page'

Dir[File.dirname(__FILE__) + '/pages/*.rb'].each do |file|
  rel__file_name = '/pages/'+File.basename(file, File.extname(file))
  require File.dirname(__FILE__)+rel__file_name
end


class App
 
  attr_reader :pages, :world, :current_page, :visited_pages

  def initialize(world)
    @world = world
    @pages = {}
    @visited_pages = []
  end

  def visit_site
    page = find_page(:HomePage)
    page.visit_me
  end

  def find_page(page_name)
    requested_page = @pages[page_name]
    if (requested_page.nil?)
      requested_page = eval("#{page_name}.new(self)")
      @pages[page_name] = requested_page
    end
    @current_page = requested_page
    @visited_pages << @current_page
    @current_page
  end

  def last_page
    @visited_pages.size >= 2 ? @visited_pages[@visited_pages.size - 2]: nil
  end


end
