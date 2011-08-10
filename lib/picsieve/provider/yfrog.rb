# = yfrog API Library
# To get the thumbnail for a picture
# == Reference
# http://code.google.com/p/imageshackapi/wiki/YFROGthumbnails
module PicSieve
  module Provider
    class Yfrog
      extend Abstract
      PATTERN = %r|http:\/\/yfrog.com\/[A-z0-9\-]+\/?|
      SUFFIX = ':small'
      class << self
        # To get a picture URL just add ":small" suffix to the source URL.
        def convert(source_url)
          picture = ::PicSieve::Picture.new
          picture.source = source_url
          picture.href = source_url.sub(/(\/|)$/, SUFFIX)
          picture.width = 125
          picture.height = 90
          [picture]
        end
      end
    end
  end
end
