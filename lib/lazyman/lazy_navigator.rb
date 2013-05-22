require 'Lazyman/errors'
module Lazyman
	class Navigator
		
		def initialize config
			@config = config.clone
			defined_browser?
			@browser = start_browser
			raise "can not start browser, maybe you need to download the driver for #{@config.browser}" if @browser.nil?
			define_goto_methods
		end

		def defined_browser?
			if !@config.respond_to?(:browser) || @config.browser.empty?
				raise IncorrectConfigFileError, 'you should define browser in your config file'
			end #if
		end

		def start_browser
			Watir::Browser.new @config.browser.to_sym
		end

		def define_goto_methods
			p Module.constants.grep(/Page$/) if $debug
			Module.constants.grep(/Page$/).each do |page_klass|
				if lazyman_page?(page_klass)
					# define_method is private,so using send
					self.class.send :define_method, "goto_#{page_klass.to_s.underscore}" do
						page = Module.const_get(page_klass).new(@browser)
						page.goto
						page
					end #define_method
					puts "defined goto_#{page_klass.to_s.underscore}" if $debug
				end #if
			end #each
		end

		def valid_page_klass? klass
			# skip Lazyman::Page
			return false if klass.eql?(:Page)
			Module.const_get(klass) < Lazyman::Page
		end
		alias_method :lazyman_page?, :valid_page_klass?

		def method_missing(m, *args, &blk)
			if @browser.respond_to? m
				@browser.send(m, *args, &blk)
			else
				super
			end #if
		end


	end

end #Lazyman
