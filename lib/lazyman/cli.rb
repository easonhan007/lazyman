require 'thor'

module Lazyman
	class CLI < Thor	
		include Thor::Actions

		argument :app_name, required: false

		def self.source_root
			File.join File.dirname(__FILE__), 'generators'
		end

		desc 'new project', 'create a lazyman project'

		def new
			if app_name
				directory 'lazyman', app_name
			else
				say 'no app name'
			end 
		end
		
	end
CLI.start

end #Lazyman

