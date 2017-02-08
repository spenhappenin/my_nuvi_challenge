# TODO
# 1) Download all zip files from http://bitly.com/nuvi-plz
# 2) Extract out the xml files
# 3) Publish the content of each xml file to a redis list called 'NEWS_XML'

require 'httparty'
require 'nokogiri'
require 'zip'
require 'redis'
require 'pry'

Dir.mkdir("tmp") unless Dir.exists?("tmp")

require_relative 'zip_files'
require_relative 'zip_file'
require_relative 'news_article'

$redis = Redis.new
zip_files = ZipFiles.new
zip_files.fetch
zip_files.process_zip_files