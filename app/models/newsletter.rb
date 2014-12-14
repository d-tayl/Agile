class Newsletter < ActiveRecord::Base
  #Uploader for newsletters
  mount_uploader :newsletter, NewsletterUploader
end
