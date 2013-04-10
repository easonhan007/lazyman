module Lazyman
	class LasymanError < StandardError; end
	class ConfigFileMissingError < LasymanError; end
	class IncorrectConfigFileError < LasymanError; end
	class InvalidLazymanPageError < LasymanError; end
end #Lazyman
