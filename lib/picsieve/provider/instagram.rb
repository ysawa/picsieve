# = Instagram API Library
# To get the thumbnail for a picture
# == Reference
# http://instagram.com/developer/embedding/
module PicSieve
  module Provider
    class Instagram
      extend Abstract
      PATTERN = %r|http:\/\/instagr\.am\/p\/[A-z0-9\-]+\/?|
      SUFFIX = '/media/?size=t'
      class << self
        def convert(source_url)
          picture = ::PicSieve::Picture.new
          picture.source = source_url
          picture.href = source_url.sub(/(\/|)$/, SUFFIX)
          picture.width = 150
          picture.height = 150
          [picture]
        end
      end
    end
  end
end
