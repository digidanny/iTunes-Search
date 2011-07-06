require 'iTunesSearch'
require 'httparty'

describe ITunesSearch, '#search' do
  it "returns a hash" do
    iTunes = ITunesSearch.new
    body = iTunes.search
    body.class.name.should == "Hash"
  end

  it "returns a hash with keys resultCount and results" do
    iTunes = ITunesSearch.new
    body = iTunes.search
    body.has_key?('resultCount').should == true && body.has_key?('results').should == true    
  end
  
  it "should url escape the params" do
    iTunes = ITunesSearch.new
    
    class HTTPartyGetMock
      def body
        return "{}"
      end
    end
    
    HTTParty.should_receive(:get).with(iTunes.search_uri + "?term=toy+story").and_return(HTTPartyGetMock.new)    
    body = iTunes.search({:term=>"toy story"})
  end  
end

describe ITunesSearch, '#query_string' do 
  it "returns a query string with escaped variables corresponding to the options param" do
    iTunes = ITunesSearch.new
    qs = iTunes.query_string({ :foo => 'bar', :me => 'you' })
    qs.should =~ /foo\=bar/ && qs.should =~ /me\=you/
  end
end

describe ITunesSearch, '#lookup' do
  it "returns a hash" do
    iTunes = ITunesSearch.new
    body = iTunes.lookup
    body.class.name.should == "Hash"
  end

  it "returns a hash with keys resultCount and results" do
    iTunes = ITunesSearch.new
    body = iTunes.lookup
    body.has_key?('resultCount').should == true && body.has_key?('results').should == true    
  end
  
  it "should url escape the id" do
    iTunes = ITunesSearch.new
    
    class HTTPartyGetMock
      def body
        return "{}"
      end
    end
    
    HTTParty.should_receive(:get).with(iTunes.lookup_uri + "?id=123").and_return(HTTPartyGetMock.new)    
    body = iTunes.lookup "123"
  end
end

describe ITunesSearch, '#view_url' do
  it "returns a string" do
    iTunes = ITunesSearch.new
    body = iTunes.view_track_url 355395846
    body.class.name.should == "String"
  end
end