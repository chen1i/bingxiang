require "bingxiang/version"
require "bingxiang/image_crawler"

module Bingxiang
  def self.fetch_image(start_page = 'http://www.bing.com', store_folder = './image_store')
    robot = ImageCrawler.new(start_page, store_folder)
    robot.run
  end
end
