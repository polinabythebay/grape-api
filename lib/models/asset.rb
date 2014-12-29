class Asset < Sequel::Model

	#needs to have an instruction
	#to associate file with the model

	mount_uploader :file, AssetUploader 
	many_to_one :user
end

