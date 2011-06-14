# To change this template, choose Tools | Templates
# and open the template in the editor.

GURKE_BASE_DIR = File.expand_path(File.dirname(__FILE__)+ "/../../..")
APP_DRIVER_LAYER = GURKE_BASE_DIR + "/features/application_driver_layers"


require 'test/unit'
require  APP_DRIVER_LAYER + "/app"

class PageObjectsTest < Test::Unit::TestCase

  def world
    w = Object.new
    def w.method_missing(symbol, *args)
      #puts "world: #{symbol}"
    end
    w
  end

  def test_plants_pages

    a = App.new(world)
    home_page = a.visit_site
    assert_page(HomePage, a, home_page)
 
    login_page = a.current_page.move_to_login_page
    assert_page(LoginPage, a, login_page)

    home_page = login_page.login("fritz", "secret")
    assert_page(HomePage, a, home_page)

    plants_page = home_page.move_to_plants_page
    assert_page(PlantsPage, a, plants_page)

    new_plant_page = plants_page.move_to_new_plant_page
    assert_page(PlantNewPage, a, new_plant_page)
 
    plant_page = new_plant_page.create_new("plant_name", "family_name")
    assert_page(PlantPage, a, plant_page)

    plant_edit_page = plant_page.move_to_edit_page
    assert_page(PlantEditPage, a, plant_edit_page)

    plant_page = plant_edit_page.edit_name("new_plant_page")
    assert_page(PlantPage, a, plant_page)

    home_page = plant_page.move_to_home
    assert_page(HomePage, a, home_page)
  end

  def test_families_pages
    a = App.new(world)
    home_page = a.visit_site

    families_page = home_page.move_to_families_page
    assert_page(FamiliesPage, a, families_page)

    family_new_page = families_page.move_to_new_family_page
    assert_page(FamilyNewPage, a, family_new_page)

    family_page = family_new_page.create_new("family_name", "starkzehrend", "C")
    assert_page(FamilyPage, a, family_page)

    puts a.visited_pages.inspect

  end

  def test_garden_pages
    a = App.new(world)
    home_page = a.visit_site
    assert_page(HomePage, a, home_page)

    gardens_page = home_page.move_to_gardens_page
    assert_page(GardensPage, a, gardens_page)

    new_garden_page = gardens_page.move_to_new_garden_page
    assert_page(GardenNewPage, a, new_garden_page)

    garden_page = new_garden_page.create_new "garden_name", "location"
    assert_page(GardenPage, a, garden_page)

    gardens_page = garden_page.move_to_gardens_page
    assert_page(GardensPage, a, gardens_page)

    garden_page = gardens_page.move_to_garden_page("garden_name")
    assert_page(GardenPage, a, garden_page)

    bed_new_page = garden_page.move_to_new_bed_page
    assert_page(BedNewPage, a, bed_new_page)

    garden_page = bed_new_page.create_new "bed_name", "C"
    assert_page(GardenPage, a, garden_page)

    bed_page = garden_page.move_to_bed_page("bed_name")
    assert_page(BedPage, a, bed_page)

    bed_edit_page = bed_page.move_to_edit_page
    assert_page(BedEditPage, a, bed_edit_page)

    garden_page = bed_edit_page.add_plant("plant_name")
    assert_page(GardenPage, a, garden_page)

  end


  private
  def assert_page(expected_class, app, page)
    assert_equal(expected_class, page.class)
    assert_equal(app.current_page, page)

  end
end
