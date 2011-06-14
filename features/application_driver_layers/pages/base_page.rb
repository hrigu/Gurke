class BasePage
  attr_accessor :content

  def initialize(app)
    @app = app
  end
  #left

  def move_to_home
    click_link "home"
    next_page(:HomePage)
  end

  def move_to_login_page
    click_link "Log in"
    next_page(:LoginPage)
  end

  def move_to_plants_page
    click_link "Pflanzen"
    next_page(:PlantsPage)

  end

  def move_to_families_page
    click_link "Gattungen"
    next_page(:FamiliesPage)
  end

  def move_to_gardens_page
    click_link "Garten"
    next_page(:GardensPage)
  end

  def to_s
    self.class.name
  end

  def inspect
    to_s
  end

  #overwrite
  def select(*args)
    @app.world.select(*args)
  end

  protected

  def method_missing(sym, *args, &block)
    @app.world.send(sym, *args, &block)
  end

  def next_page(page_class_sym)
    @app.find_page(page_class_sym, response)
  end

end
