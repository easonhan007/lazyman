class String
	def lazy_to_hash
		hash = { }
		return hash if self.empty?
		self.split(',').map { |i| i.strip }.each do |key|
			hash[key.to_sym] = true 
		end #each
	end

end
