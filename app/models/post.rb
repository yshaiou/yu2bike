class Post < ActiveRecord::Base
	#validates post input
	#validates :title, presence: true, length {minimum : 5}
	# validates user's input, title has to be more than 5 char
	validates :title, presence: true, length: {minimum: 5}
	validates :body, presence: true
	# dependent: :destroy make sure once a post is deleted, the comement also gets deleted
	has_many :comments, dependent: :destroy
end
