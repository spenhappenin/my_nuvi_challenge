-- Nuvi Code Challenge --

This application downloads all the zip files, extracts out the xml files, and publishes the content of each xml file from the specified HTTP folder to a Redis list called "NEWS_XML".

-- Setup Instructions --

1) Clone the repo and cd into it.
2) Run bundle install to install all the dependencies.
3) Make sure redis is installed on your local machine, you can follow this guide on 		   getting it set up: [Redis quick start](http://redis.io/topics/quickstart).
4) Once redis is installed run the redis server with the command redis-server.
5) Run the app, cd into lib and run ruby index.rb.