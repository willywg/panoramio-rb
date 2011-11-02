require 'rubygems'
require 'json'
require 'hashie'
require 'rest_client'

module PanoramioRb
  URL = 'http://www.panoramio.com/map/get_panoramas.php'
  DEFAULT_OPTIONS = {
    :set => :public,  # Cant be :public, :full, or a USER ID number
    :size => :medium, # Cant be :original, :medium (default value), :small, :thumbnail, :square, :mini_square
    :from => 0,
    :to => 20,
    :mapfilter => true
  }
  
  def self.get_panoramas(options = {})
    panoramio_options = DEFAULT_OPTIONS
    panoramio_options.merge!(options)
    response = RestClient.get URL, :params => panoramio_options
    if response.code == 200
      parse_data = JSON.parse(response.to_str)
      Hashie::Mash.new(parse_data)
    else
      raise "Panoramio API error: #{response.code}. Response #{response.to_str}"
    end
  end
end
