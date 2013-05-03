require 'mechanize'

module Dicdic
	class Agent < Mechanize
		def initialize
			super
			self.user_agent_alias = 'Mac Safari'
		end

		def translate(sentence,start_lang,dest_lang)
			result = ""
			result += "#{sentence}"
			result += "(#{start_lang})".red
			result += " --> "
			get(Dicdic::TRANSLATE_HOSTNAME) do |page|
				search_result = page.form_with(:name => 'text_form') do |search|
				    search.text = sentence
				    search.sl = start_lang 
				    search.tl = dest_lang
				end.submit
				search_result.parser.xpath('//div/span[@id="result_box"]').each do |row|
	          		row.xpath('span/text()').each do |span_row|
	          			result += "#{span_row}"
	          			result += "(#{dest_lang})".yellow
	          		end		          
		        end
			end
			puts result
		end

		def dictionary(word)
			word_dic = {}
			dic_url = Dicdic::DICTIONARY_HOSTNAME+"?q="+word
			get(dic_url) do |page|
				page.parser.xpath('//div[@class]').collect do |div|
					if div[:class].include? 'txt_means_'
						lang_code = div[:class][-2,2]
						word_dic[lang_code] = div.text()
					end
				end
			end
			word_dic
		end
	end
end