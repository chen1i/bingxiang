require 'selenium-webdriver'
require 'httparty'

module Bingxiang
  class ImageCrawler
    def initialize(start_url, image_store='/tmp/image_store')
      @start_url = start_url
      if File.exists? image_store
        @image_store = image_store
      else
        raise "Abort: please specify image store dir first."
      end
    end

    def run
      driver = Selenium::WebDriver.for :chrome
      puts "starting from #{@start_url}"
      driver.navigate.to @start_url

      begin
      # part of style is "background-image: url(http://www.bing.com/az/hprichbg/rb/OKMemorial_EN-US9081453606_1920x1080.jpg)"
      img_url = driver.find_element(:id, 'bgDiv').style('background-image')[/url\((.*)\)/, 1]
      raise "oops." if img_url.nil?
      rescue
        puts "find nothing, retrying ... "
        retry
      end

      driver.close

      file_name = URI(img_url).path.split('/').last
      image_file_path = @image_store + '/' + file_name
      File.open(image_file_path, 'wb') do |f|
        f.write HTTParty.get(img_url).parsed_response
      end

      puts "done!"
    end
  end
end