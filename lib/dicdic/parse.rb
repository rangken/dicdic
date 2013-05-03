require 'mechanize'

module Dicdic
	class Parser < ::Mechanize
		def initialize
			super
			self.user_agent_alias = 'Mac Safari'
		end

		 def get(uri, parameters = [], referer = nil, headers = {})
	        uri = ::File.join("http://#{Dicdic::HOSTNAME}", uri) unless /^http?/ === uri

	        3.times do
	          	super(uri, parameters, referer, headers)
	          	return page unless page.respond_to?(:title)
	        end
	    end
		def parse
			url = "http://dic.daum.net/search.do?q=hello"
			get(url)
		end
		
	end
end