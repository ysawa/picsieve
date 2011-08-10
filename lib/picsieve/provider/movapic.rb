# = Keitaihakkei(movapic.com) API Library
# To get the thumbnail for a picture
module PicSieve
  module Provider
    class Movapic
      extend Abstract
      PATTERN = %r|http:\/\/movapic.com\/pic\/([A-z0-9]+)\/?|
      class << self
        # To get a picture URL just add ":small" suffix to the source URL.
        def convert(source_url)
          picture = ::PicSieve::Picture.new
          picture.source = source_url
          picture.href = source_url.sub(PATTERN, 'http://image.movapic.com/pic/s_\1.jpeg')
          picture.width = 320
          picture.height = 238
          [picture]
        end
      end
    end
  end
end
