require 'yaml'
require 'lazyman/errors'
require 'ostruct'

module Lazyman
	class LazyConfig
		attr_reader :hash_content, :content
		
		def initialize filepath
			@f ||= filepath if valid?(filepath)
			File.open(@f) {|handle| @hash_content = YAML.load(handle)}
			@content = OpenStruct.new(@hash_content)
		end
		
		def valid?(filepath)
			raise ConfigFileMissingError unless File.exists?(filepath)
			true
		end

	end
end #Lazyman
