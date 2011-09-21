class Task < ActiveRecord::Base
  belongs_to :garden
  attr_accessible :created_at, :done_at, :title, :body
end
