class Comment < ActiveRecord::Base
  #passes this model to post model
  belongs_to :post
end
