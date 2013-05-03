module Dicdic
	class ParsingError < RuntimeError; end
	module Helpers
		def agent
			unless @agent
				@agent = Dicdic::Agent.new
			end

			return @agent
		end

		def pluralize(n, singular, plural = nil)
        	n.to_i == 1 ? "1 #{singular}" : "#{n} #{plural || singular + 's'}"
      	end

      	def try
      		return unless block_given?

      		begin 
      			yield
      		rescue ParsingError
      			say_error "Fuck"
      		end
      	end
	end
end