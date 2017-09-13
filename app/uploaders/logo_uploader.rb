class LogoUploader < CarrierWave::Uploader::Base

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  process resize_to_fit: [200, 200]

  def extension_whitelist
    %w(jpg jpeg png)
  end

end
