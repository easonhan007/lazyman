module Lazyman
	class Page
		include PageObject	

		def method_missing(m, *args, &blk)
			if @browser.respond_to? m
				@browser.send(m, *args, &blk)
			else
				super
			end #if
		end 

		def turn_to kls
			raise "#{kls} is not a instance of Lazyman::Page" unless kls <= Lazyman::Page
			kls.new(@browser)
		end

	end #Page

end #Lazyman
