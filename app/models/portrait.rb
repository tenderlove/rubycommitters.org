class Portrait < ActiveRecord::Base
  mount_uploader :file, PortraitUploader
  belongs_to :hero
end
