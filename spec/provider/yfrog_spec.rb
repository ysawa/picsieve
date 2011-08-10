require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

def yfrog_source_url
  'http://yfrog.com/0ah5rvw4z'
end

describe 'PicSieve::Provider::Yfrog' do
  it 'convert source url to picture url' do
    pictures = PicSieve::Provider::Yfrog.convert yfrog_source_url
    picture = pictures.first
    picture.href.should include PicSieve::Provider::Yfrog::SUFFIX
  end

  it 'search source urls' do
    text = "aaa #{yfrog_source_url} bbb #{yfrog_source_url}"
    source_urls = PicSieve::Provider::Yfrog.search text
    source_urls.should include yfrog_source_url
    source_urls.count.should == 1
  end
end
