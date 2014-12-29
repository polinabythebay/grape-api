require "test_helper"
require "models/user"

describe "User" do
	include Rack::Test::Methods 

	def app 
		API::App 
	end

	describe "signing up" do
		before do
			post "/users", user: {
			handler: "psoshnin",
			name: "Polina Soshnin",
			password: "testpass"
		}
		end

		it "creates a user" do
			last_response.status.must_equal 201
			#201= created 
		end

		it "shows the handler" do
			#skip 
			last_response.body.must_include "psoshnin"
		end

		it "shows the name" do
			#skip
			last_response.body.must_include "Polina Soshnin"
		end
	end
end




	