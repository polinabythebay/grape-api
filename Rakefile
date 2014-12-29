require "rake/testtask"

Rake::TestTask.new do |t|
	t.pattern = "test/**/*_test.rb"
	t.libs << "lib"
	t.libs << "test"
end

task default: :test

# task routes: :environment do
#   API::AppV2.routes.each do |route|
#     method = route.route_method.ljust(10)
#     path = route.route_path
#     puts "     #{method} #{path}"
#   end
# end


