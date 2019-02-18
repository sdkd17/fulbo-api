class User < ApplicationRecord
	serialize :phones, ::Array
end
