require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

def movapic_source_url
  'http://movapic.com/pic/201108102224584e4286aaf2fa1'
end

describe 'PicSieve::Provider::Movapic' do
  it 'convert source url to picture url' do
    pictures = PicSieve::Provider::Movapic.convert movapic_source_url
    picture = pictures.first
    picture.href.should include 'http://image.movapic'
    picture.href.should include '/s_'
    picture.href.should include '.jpeg'
  end

  it 'search source urls' do
    text = "aaa #{movapic_source_url} bbb #{movapic_source_url}"
    source_urls = PicSieve::Provider::Movapic.search text
    source_urls.should include movapic_source_url
    source_urls.count.should == 1
  end
end
