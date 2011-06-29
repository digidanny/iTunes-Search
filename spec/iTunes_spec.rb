require 'iTunes'
require 'httparty'

describe ITunes, '#search' do
  it "returns a hash" do
    iTunes = ITunes.new
    body = iTunes.search
    body.class.name.should == "Hash"
  end

  it "returns a hash with keys resultCount and results" do
    iTunes = ITunes.new
    body = iTunes.search
    body.has_key?('resultCount').should == true && body.has_key?('results').should == true    
  end
end

describe ITunes, '#query_string' do 
  it "returns a query string with escaped variables corresponding to the options param" do
    iTunes = ITunes.new
    qs = iTunes.query_string({ :foo => 'bar', :me => 'you' })
    qs.should =~ /foo\=bar/ && qs.should =~ /me\=you/
  end
end