require "test_helper"
require "uploaders/asset"
require "models/asset"
require "app"


#test to search for the get route 
describe "listing all files" do
	include Rack::Test::Methods

	def app
		API::App 
	end

	before do
		get "/files"
	end

	it "provides a valid repsonse" do
		last_response.status.must_equal 200
	end

	it "lists all files" do
		last_response.body.must_include "My first zip file"
	end

end