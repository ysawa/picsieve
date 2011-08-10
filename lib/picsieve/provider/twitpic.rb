# = Twitpic API Library
# To get the thumbnail for a picture
# == Reference
# http://dev.twitpic.com/docs/thumbnails/
module PicSieve
  module Provider
    class Twitpic
      extend Abstract
      PATTERN = %r|http:\/\/twitpic\.com\/([A-z0-9\-]+)\/?|
      class << self
        def convert(source_url)
          picture = ::PicSieve::Picture.new
          picture.source = source_url
          picture.href = source_url.gsub(PicSieve::Provider::Twitpic::PATTERN, 'http://twitpic.com/show/thumb/\1')
          picture.width = 150
          picture.height = 150
          [picture]
        end
      end
    end
  end
end
