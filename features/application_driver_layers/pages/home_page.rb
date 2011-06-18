require File.dirname(__FILE__)+ "/base_page"
class HomePage < BasePage

  def visit_me
    visit "/"
    next_page(:HomePage)
  end

end
