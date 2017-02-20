class NewsArticle

	attr_reader :content, :channel, :filename

	def initialize(params={})
		@content = params[:content]
		@channel = params[:channel] || "NEWS_XML"
		@filename = params[:filename]
	end

	def publish 
		$redis.hset(channel, filename, content) if self.not_yet_published?
	end

	def not_yet_published?
		!$redis.hexists(self.channel, self.filename)
	end

end