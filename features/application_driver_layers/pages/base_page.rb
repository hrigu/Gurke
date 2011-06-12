class BasePage
  attr_accessor :content

  def initialize(world, content = nil)
    @world = world
    @content = content
  end

  def method_missing(sym, *args, &block)
  #  puts "method_missing: #{sym}, #{args}"
    @world.send sym, *args, &block
  end

  #left
    def move_to_login_page
    click_link "Log in"
    LoginPage.new(@world, response)
  end

  def move_to_plants_page
   click_link "Pflanzen"
    PlantsPage.new(@world, response)

  end

  def move_to_families_page
    click_link "Gattungen"
    FamiliesPage.new(@world, response)
  end

  def move_to_garten_page
    click_link "Garten"
    GardensPage.new(@world, response)
  end

end
