require "test_helper"
require "uploaders/asset"
require "models/asset"
require "apps/v2"


describe "Upload a file" do

	include Rack::Test::Methods

	def app
		API::AppV2
	end

	describe "when authorized" do

		before do

			file_path = fixture_path "zip.zip"

			#allows you to pass in 
			#http basic authentication
			authorize "psoshnin", "testpass"
			post "/v2/files", {
				file: {

					title: "My first zip file",
					file: Rack::Test::UploadedFile.new(file_path, "application/zip", true)
				}
			} 
		end

		it "uploads a file" do
			last_response.status.must_equal 201
		end

		it "retrieves the content for the new file" do 
			last_response.body.must_include "My first zip file"
		end

		it "retrieves the actual filename" do
			# require "pry"; binding.pry
			last_response.body.must_include "zip.zip"
		end

		it "retrieves the full path of the file" do
			# require "pry"; binding.pry
			last_response.body.must_include "public/uploads/assets"
		end

		it "references the user from the file" do
			last_response.body.must_include "psoshnin"
		end
	end 

	describe "when not authorized" do 

		it "fails if no authentication is provided" do
			post "/v2/files"

			last_response.status.must_equal 401 #unauthorized
		end
	end

end
