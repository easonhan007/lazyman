require 'spec_helper'

describe String do

	it 'lazy_to_hash should have correct behavor' do
		str = 'a, b, c, d'
		str.lazy_to_hash.should eq({a: true, b: true, c: true, d: true})
	end

end
