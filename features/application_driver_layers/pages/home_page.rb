require File.dirname(__FILE__)+ "/base_page"
class HomePage < BasePage

  def visit_me
    visit "/"
    self
  end

end
