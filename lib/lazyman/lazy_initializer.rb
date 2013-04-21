module Lazyman
	class Initializer
		def initialize root, app_name
			@root ||= root
			@app_name ||= app_name
			load_config
			load_app_page_and_navigator
			load_all_components
			load_all_pages
			generate_pathes
		end

		def load_app_page_and_navigator
			@pages_path = File.join(@root, 'app', 'pages')
			$:.unshift(@pages_path)
			require File.join(@pages_path, "#{@app_name}_page")
			require File.join(@pages_path, "#{@app_name}_navigator")
		end

		def load_all_components
			@components_path = File.join(@pages_path, 'components')
			Dir.glob(File.join @components_path, '**', '*.rb').select {|p| p =~ /\.rb$/}.each do |c|
				puts c if $debug
				require "#{c}" 
			end #each
		end
		
		def load_all_pages
			Dir.glob(File.join @pages_path, '**', '*.rb').select { |p| p =~ /page\.rb$/ }.each do |page|
				puts "#{page}" if $debug
				require "#{page}"
			end #each
		end

		def load_config
			# hard code config file name here
			@config_file = File.join @root, 'config', 'config.yml'
			$config = Config.new(@config_file).content  
		end

		def generate_pathes
			$root = @root
			$pages = @pages_path
			$components = @components_path
		end

	end
end #Lazyman
