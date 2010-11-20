# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
GestionMagasin::Application.initialize!
DEFAULT_CURRENCY_VALUES	= { :format => "%n %u", :unit => "DA", :separator => ".", :delimiter => " ", :precision => 2, :significant => false, :strip_insignificant_zeros => false }
