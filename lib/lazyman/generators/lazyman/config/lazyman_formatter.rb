require 'erb'
require 'rspec/core/formatters/html_formatter'

module Lazyman
	class LazymanFormatter < ::RSpec::Core::Formatters::HtmlFormatter
		def initialize(output)
			output = File.new(File.expand_path(File.join('.', 'app', 'reports', "#{Time.now.strftime("%Y%m%d_%H%M%S")}.html")), 'w')
			super(output)
			@printer.class.send(:define_method, 'puts') do |what|
				@output.puts what
			end #define_method
		end

		def example_failed(example)
			super(example)
			if $navi
				failed_url = $navi.url rescue $navi.current_url
				@printer.puts "<a target=\"_blank\" href=\"#{failed_url}\">failed url is [#{failed_url}]</a>" 
				@printer.puts '<br />'
				@printer.flush
			end #if
		end
	end #LazymanFormatter
end #Lazyman
