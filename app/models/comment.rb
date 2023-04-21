class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :commentable, polymorphic: true
    scope :property, ->{ where(:commentable_type => 'Property') }
    scope :agent, -> { where(:commentable_type => 'Agent') }
    validates:content ,presence:true
end
