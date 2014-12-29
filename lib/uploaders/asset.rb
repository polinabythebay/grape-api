class AssetUploader < CarrierWave::Uploader::Base
	

	storage :file

	def store_dir
		#filepath in which all files stored
		"public/uploads/assets/#{model.id}"
	end
end

