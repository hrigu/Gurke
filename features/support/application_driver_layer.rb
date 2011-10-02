require File.dirname(__FILE__) + '/../application_driver_layers/dummy_driver'
require File.dirname(__FILE__) + '/../application_driver_layers/webrat_driver'
require File.dirname(__FILE__) + '/../application_driver_layers/capybara_driver'
require File.dirname(__FILE__) + '/../application_driver_layers/direct_class_driver'

#World(DummyDriver)
World(CapybaraDriver)
#World(DirectClassDriver)

