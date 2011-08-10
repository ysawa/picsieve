require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

def twitpic_source_url
  'http://twitpic.com/1e10a'
end

describe 'PicSieve::Provider::Twitpic' do
  it 'convert source url to picture url' do
    pictures = PicSieve::Provider::Twitpic.convert twitpic_source_url
    picture = pictures.first
    picture.href.should include 'show/thumb'
  end

  it 'search source urls' do
    text = "aaa #{twitpic_source_url} bbb #{twitpic_source_url}"
    source_urls = PicSieve::Provider::Twitpic.search text
    source_urls.should include twitpic_source_url
    source_urls.count.should == 1
  end
end
