require 'ostruct'
require 'httparty'
require 'active_support'
require 'cgi'

class ITunes < OpenStruct
  
  VERSION = "0.0.1"
  
  def initialize
    @base_uri = "http://itunes.apple.com/search"    
  end

  def query_string(options)
    options.map {|k,v| ( !v.blank? ? CGI.escape(k.to_s) + '=' + CGI.escape(v) : nil ) }.join('&')
  end
  
  def search(options = {})
    ActiveSupport::JSON.decode(HTTParty.get(@base_uri + "?#{self.query_string options}").body)
  end
  
end