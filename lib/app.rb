module API
	class App < Grape::API
		version :v1, using: :accept_version_header

		use Rack::Config do |env|
			env['api.tilt.root'] = File.join Dir.pwd, "lib/views"
		end

		default_format :json
		formatter :json, Grape::Formatter::Rabl

		resource :files do 
			get '/', rabl: "assets/collection" do
				@assets = Asset.all 
			end

			post '/', rabl: "assets/item" do #files
				#require "pry"; binding.pry
				# params[:file].delete :file 
				
				@asset = Asset.new params[:file]
				@asset.save
			end	

			#custom routes with dynamic parameter
			#301/302 represents a redirection
			# get '/:id/download' do
			# 	file = Asset[params[:id]]
			# 	path = file.file_url.gsub("public/","")

			# 	redirect path 
			# end
		end

		resource :users do 
			post "/", rabl: "users/item" do 
				@user = User.new params[:user]
				@user.save
			end
		end

	end
end

