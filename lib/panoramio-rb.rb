# coding: utf-8
require "panoramio-rb/version"
require 'json'
require 'hashie'
require 'rest_client'
require 'geocoder/calculations'

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
    panoramio_options = panoramio_options.merge(options)
    response = RestClient.get URL, :params => panoramio_options
    if response.code == 200
      parse_data = JSON.parse(response.to_str)
      Hashie::Mash.new(parse_data)
    else
      raise "Panoramio API error: #{response.code}. Response #{response.to_str}"
    end
  end

  def self.get_panoramas_from_point(point, radius = 10, unit = :mi, options = {})
    points = Geocoder::Calculations.bounding_box(point, radius, { :units => unit })
    options.merge!({
      :miny => points[0],
      :minx => points[1],
      :maxy => points[2],
      :maxx => points[3] 
    })
    self.get_panoramas(options)
  end
end
