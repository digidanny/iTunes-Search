require 'ostruct'
require 'httparty'
require 'active_support'
require 'cgi'

class ITunesSearch < OpenStruct
  attr_accessor :search_uri, :lookup_uri
  
  def initialize
    @search_uri = "http://itunes.apple.com/search"    
    @lookup_uri = "http://ax.phobos.apple.com.edgesuite.net/WebObjects/MZStoreServices.woa/wa/wsLookup"
  end

  def query_string(options)
    options.map {|k,v| ( !v.blank? ? CGI.escape(k.to_s) + '=' + CGI.escape(v) : nil ) }.join('&')
  end
  
  def search(options = {})
    ActiveSupport::JSON.decode(HTTParty.get(@search_uri + "?#{self.query_string options}").body)
  end

  def lookup(id = "")
    ActiveSupport::JSON.decode(HTTParty.get(@lookup_uri + "?id=#{id}").body)
  end
  
  def view_track_url(id)
    payload = self.lookup id
    if payload['results'].length
      payload['results'][0]['trackViewUrl']
    else
      nil
    end
  end
end