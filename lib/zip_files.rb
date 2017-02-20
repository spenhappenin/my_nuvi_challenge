class ZipFiles

	attr_accessor :zip_extensions, :zip_files, :url

	def initialize(params={})
		@zip_paths = []
		@zip_extensions = []
		@url = params[:url] || "http://feed.omgili.com/5Rh5AMTrc4Pv/mainstream/posts/"
	end

	def fetch 
		doc = Nokogiri::HTML(HTTParty.get(self.url).body)
		table_row_links = doc.css("a")

		table_row_links.each do |link|
			if !!link.attributes["href"].value.match(/.zip\z/)
				self.zip_extensions << link.attributes["href"].value
			end
		end
	end

	def process_zip_files
		@zip_extensions.each do |extension|
			current_zip = ZipFile.new( { zip_file_path: extension, base_url: self.url } )
			current_zip.download_zip_file
			current_zip.unzip_and_publish_content
		end
	end
end