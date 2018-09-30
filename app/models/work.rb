class Work < ApplicationRecord
  belongs_to :user
  mount_uploader :video, VideoUploader

  validates :video, :presence => true
end
