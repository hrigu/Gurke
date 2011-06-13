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

  def find_page(page_name, content = nil)
    page = @pages[page_name]
    if (page.nil?)
      page = eval("#{page_name}.new(self)")
      @pages[page_name] = page
    end
    page.content = content
    @current_page = page
    @visited_pages << @current_page
    @current_page
  end

  def last_page
    @visited_pages.size >= 2 ? @visited_pages[@visited_pages.size - 2]: nil
  end

end
