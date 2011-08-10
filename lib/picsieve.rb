module PicSieve
  autoload :Picture, 'picsieve/picture'

  PROVIDERS = %w(Instagram Twitpic Yfrog)

  module Provider
    autoload :Abstract, 'picsieve/provider/abstract'
    autoload :Instagram, 'picsieve/provider/instagram'
    autoload :Twitpic, 'picsieve/provider/twitpic'
    autoload :Yfrog, 'picsieve/provider/yfrog'
  end

  def PicSieve.sieve(text)
    pictures = []
    PROVIDERS.each do |provider|
      pictures += eval('Provider::' + provider).search_and_convert_all(text)
    end
    pictures
  end

end
