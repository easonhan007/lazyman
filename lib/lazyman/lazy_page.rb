require 'lazyman/errors'
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
			raise InvalidLazymanPageError unless kls <= Lazyman::Page
			kls.new(@browser)
		end

		def data_driven hash, &blk
			raise ArgumentError unless hash.is_a?(Hash)
			hash.each do |mtd, data|
				m_with_eql = (mtd.to_s + '=').to_sym
				if respond_to?(m_with_eql)
					self.send(m_with_eql, data)
				elsif respond_to?(mtd.to_sym)
					self.send(mtd.to_sym).send(data.to_sym) 
				end #if
			end #each
			class_eval &blk if block_given?
		end

	end #Page

end #Lazyman
