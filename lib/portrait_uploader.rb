class PortraitUploader < CarrierWave::Uploader::Base

  ##
  # Image manipulator library:
  #
  # include CarrierWave::RMagick
  # include CarrierWave::ImageScience
  include CarrierWave::MiniMagick

  ##
  # Storage type
  #
  storage :file
  #
  # configure do |config|
  #   config.s3_access_key_id = 'xxxx'
  #   config.s3_secret_access_key = 'xxxx'
  #   config.s3_bucket = 'assets-web'
  # end
  #
  # storage :right_s3


  ## Manually set root
  def root; File.join(Padrino.root,"public/"); end

  ##
  # Directory where uploaded files will be stored (default is /public/uploads)
  #
  def store_dir
    'images/portraits/'
  end

  ##
  # Directory where uploaded temp files will be stored (default is [root]/tmp)
  #
  def cache_dir
    Padrino.root("tmp")
  end

  ##
  # Default URL as a default if there hasn't been a file uploaded
  #
  def default_url
    'http://placehold.it/100x100'
  end

  ##
  # Process files as they are uploaded.
  #
  process :resize_to_fill => [100, 100]
  # version :thumb do
  #   process :resize_to_fill => [100, 100]
  # end
  #
  # def scale(width, height)
  #   # do something
  # end

  ##
  # Create different versions of your uploaded files
  #
  # version :header do
  #   process :resize_to_fill => [940, 250]
  #   version :thumb do
  #     process :resize_to_fill => [230, 85]
  #   end
  # end
  ##
  # White list of extensions which are allowed to be uploaded:
  #
  # def extension_white_list
  #   %w(jpg jpeg gif png)
  # end

  ##
  # Override the filename of the uploaded files
  #
  def filename
    if original_filename
      original_extname = File.extname(original_filename)
      "#{model.hero.username}_#{model.id}#{original_extname.blank? ? '.jpg' : original_extname}"
    end
  end
  #
end
