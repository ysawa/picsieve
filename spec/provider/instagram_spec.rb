require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

def instagram_source_url
  'http://instagr.am/p/ABcd1/'
end

describe 'PicSieve::Provider::Instagram' do
  it 'convert source url to picture url' do
    pictures = PicSieve::Provider::Instagram.convert instagram_source_url
    picture = pictures.first
    picture.href.should include PicSieve::Provider::Instagram::SUFFIX
  end

  it 'search source urls' do
    text = "aaa #{instagram_source_url} bbb #{instagram_source_url}"
    source_urls = PicSieve::Provider::Instagram.search text
    source_urls.should include instagram_source_url
    source_urls.count.should == 1
  end
end
