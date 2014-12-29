require "test_helper"
require "env"
require "uploaders/asset"
require "models/asset"
require "apps/v2"

describe "Download a file" do
	include Rack::Test::Methods

	def app
		API::AppV2
	end

	it "downloads a file" do
		authorize "psoshnin", "testpass"
		asset = Asset.last
		get "/v2/files/#{asset.id}/download"

		last_response.status.must_equal 302
		#could also be 302 to pass
	end
end


