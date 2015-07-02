class Post < ActiveRecord::Base
	#validates post input
	#validates :title, presence: true, length {minimum : 5}
	validates :title, presence: true, length: {minimum: 5}
	validates :body, presence: true
end
