module PicSieve
  module Provider
    module Abstract
      def convert(source_url)
        []
      end

      def search(text)
        self::PATTERN.match(text).to_a.uniq
      end

      def search_and_convert_all(text)
        pictures = []
        search(text).each do |source_url|
          pictures += convert(source_url)
        end
        pictures
      end
    end
  end
end
