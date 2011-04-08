require 'spec_helper'
require "generator_spec/test_case"
require 'generators/merryh5bp/install_generator'

describe Merryh5bp::Generators::InstallGenerator do
  include GeneratorSpec::TestCase
  destination File.expand_path("../../tmp", __FILE__)
  tests Merryh5bp::Generators::InstallGenerator
  arguments %w(something)

  before(:all) do
    prepare_destination
  end

  it "should remove the default application.html" do
    run_generator
    #puts File.expand_path("../../../../dummy", __FILE__)
    assert_file "app/views/layouts/application.html.erb" do |layout|
      assert_no_match /stylesheet_link_tag/, index
    end 
  end
  
  
  # it "should remove previously generated files"
  #   it "should install the new application.html"
  #   it "should install style.css stylesheet"
  #   it "should install the grids"
  #   it "should install libs/dd_belatedpng.js script"
  #   it "should install libs/modernizr.js script v1.7"
  
end